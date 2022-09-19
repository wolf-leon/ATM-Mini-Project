-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2022 at 07:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t_atmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `customer_id` int(11) NOT NULL,
  `card_number` bigint(12) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `balance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`customer_id`, `card_number`, `customer_name`, `balance`) VALUES
(1, 5088611178840000, 'Nadia', 19000),
(2, 5088611178840001, 'Michelle', 29890),
(3, 5088611178840002, 'Saloni', 12434),
(4, 5088611178840003, 'Leon', 501433),
(5, 5088611178840004, 'Lizanne', 72000),
(6, 5088611178840005, 'Deandra', 780395),
(7, 5088611178840006, 'Kimberly', 455900);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(11) NOT NULL,
  `card_number` bigint(12) NOT NULL,
  `pin` int(4) NOT NULL,
  `expiry_date` date NOT NULL,
  `card_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `card_number`, `pin`, `expiry_date`, `card_status`) VALUES
(1, 5088611178840000, 1234, '2024-09-24', 2),
(2, 5088611178840001, 1234, '2025-10-27', 2),
(3, 5088611178840002, 1212, '2023-03-07', 2),
(4, 5088611178840003, 1235, '2022-08-09', 3),
(5, 5088611178840004, 1234, '2025-10-27', 1),
(6, 5088611178840005, 9099, '2025-04-04', 2),
(7, 5088611178840006, 2512, '2024-06-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `denomination`
--

CREATE TABLE `denomination` (
  `fifty` int(11) NOT NULL,
  `hundred` int(11) NOT NULL,
  `fivehundred` int(11) NOT NULL,
  `onethousand` int(11) NOT NULL,
  `twothousand` int(11) NOT NULL,
  `total_balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `denomination`
--

INSERT INTO `denomination` (`fifty`, `hundred`, `fivehundred`, `onethousand`, `twothousand`, `total_balance`) VALUES
(38, 0, 8, 4, 15, 39900),
(2, 0, 0, 0, 3, 6100);

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `operation_id` int(1) NOT NULL,
  `operation_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`operation_id`, `operation_type`) VALUES
(1, 'Withdraw'),
(2, 'Transfer'),
(3, 'View Balance'),
(4, 'Deposit');

-- --------------------------------------------------------

--
-- Table structure for table `statustype`
--

CREATE TABLE `statustype` (
  `status_id` int(11) NOT NULL,
  `status_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statustype`
--

INSERT INTO `statustype` (`status_id`, `status_type`) VALUES
(1, 'Active'),
(2, 'Blocked'),
(3, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `card_number` bigint(12) NOT NULL,
  `operation` int(1) NOT NULL,
  `amount` mediumint(9) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `transaction_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `card_number`, `operation`, `amount`, `transaction_time`, `transaction_status`) VALUES
(1, 5088611178840002, 3, 0, '2022-09-13 08:11:11', 1),
(2, 5088611178840000, 1, 1000, '2022-09-13 09:10:21', 1),
(3, 5088611178840000, 1, 5500, '2022-09-13 09:25:11', 1),
(4, 5088611178840000, 2, 10000, '2022-09-13 10:09:21', 1),
(5, 5088611178840001, 2, 5, '2022-09-14 11:50:22', 1),
(6, 5088611178840001, 2, 500, '2022-09-14 13:51:20', 1),
(7, 5088611178840000, 2, 500, '2022-09-14 14:00:29', 1),
(8, 5088611178840000, 2, 300, '2022-09-14 14:23:00', 1),
(9, 5088611178840000, 2, 8388607, '2022-09-14 14:32:07', 0),
(10, 5088611178840000, 1, 0, '2022-09-14 15:09:48', 0),
(11, 5088611178840000, 1, 10500, '2022-09-14 15:11:51', 1),
(12, 5088611178840000, 1, 0, '2022-09-14 15:19:33', 0),
(13, 5088611178840000, 1, 0, '2022-09-14 15:26:57', 0),
(14, 5088611178840000, 1, 0, '2022-09-14 15:41:13', 0),
(15, 5088611178840000, 1, 3000, '2022-09-14 15:41:49', 1),
(16, 5088611178840000, 2, 2000, '2022-09-14 15:44:08', 0),
(17, 5088611178840000, 2, 500, '2022-09-14 15:45:14', 1),
(32, 5088611178840001, 2, 1, '2022-09-15 16:35:17', 1),
(33, 5088611178840001, 3, 0, '0000-00-00 00:00:00', 1),
(34, 5088611178840001, 3, 0, '0000-00-00 00:00:00', 1),
(35, 5088611178840001, 3, 0, '2022-09-15 16:41:46', 1),
(36, 5088611178840001, 3, 0, '2022-09-15 16:45:24', 1),
(37, 5088611178840001, 3, 0, '2022-09-15 16:46:05', 1),
(38, 5088611178840001, 3, 0, '2022-09-15 16:47:49', 1),
(39, 5088611178840001, 3, 0, '2022-09-15 16:48:38', 1),
(40, 5088611178840001, 3, 0, '2022-09-15 16:49:25', 1),
(41, 5088611178840001, 3, 0, '2022-09-15 16:49:41', 1),
(42, 5088611178840002, 2, 2000, '2022-09-15 17:01:13', 1),
(43, 5088611178840002, 3, 0, '2022-09-15 17:02:40', 1),
(44, 5088611178840002, 3, 0, '2022-09-15 17:03:32', 1),
(45, 5088611178840002, 3, 0, '2022-09-15 17:03:48', 1),
(46, 5088611178840000, 2, 500, '2022-09-15 20:48:19', 1),
(47, 5088611178840000, 3, 0, '2022-09-15 20:48:29', 1),
(48, 5088611178840000, 3, 0, '2022-09-15 20:50:13', 1),
(49, 5088611178840000, 3, 0, '2022-09-15 20:55:59', 1),
(50, 5088611178840000, 3, 0, '2022-09-15 20:57:24', 1),
(51, 5088611178840001, 3, 0, '2022-09-15 21:57:37', 1),
(52, 5088611178840001, 3, 0, '2022-09-15 21:57:56', 1),
(53, 5088611178840001, 3, 0, '2022-09-15 21:58:19', 1),
(54, 5088611178840001, 2, 233, '2022-09-15 22:03:31', 1),
(55, 5088611178840001, 1, 30000, '2022-09-15 22:09:48', 1),
(56, 5088611178840001, 2, 30000, '2022-09-15 22:10:21', 1),
(57, 5088611178840001, 2, 5000, '2022-09-15 22:17:05', 0),
(58, 5088611178840004, 2, 5000, '2022-09-15 22:28:29', 1),
(59, 5088611178840001, 2, 4000, '2022-09-15 22:30:36', 0),
(60, 5088611178840001, 1, 500, '2022-09-16 10:37:30', 1),
(61, 5088611178840001, 1, 100, '2022-09-16 10:41:32', 1),
(62, 5088611178840001, 1, 100, '2022-09-16 10:41:51', 1),
(63, 5088611178840004, 3, 0, '2022-09-16 11:50:04', 1),
(64, 5088611178840001, 2, 100000, '2022-09-16 12:01:36', 0),
(65, 5088611178840001, 1, 50, '2022-09-16 12:11:33', 1),
(66, 5088611178840001, 2, 400, '2022-09-16 12:12:11', 1),
(67, 5088611178840001, 3, 0, '2022-09-16 12:12:20', 1),
(68, 5088611178840001, 3, 0, '2022-09-16 12:12:39', 1),
(69, 5088611178840001, 3, 0, '2022-09-16 12:24:54', 1),
(70, 5088611178840000, 2, 200, '2022-09-16 13:29:15', 1),
(71, 5088611178840000, 1, 1000, '2022-09-16 14:55:24', 1),
(72, 5088611178840004, 2, 2000, '2022-09-16 15:04:26', 1),
(73, 5088611178840004, 3, 0, '2022-09-16 15:04:34', 1),
(74, 5088611178840004, 3, 0, '2022-09-16 15:04:37', 1),
(75, 5088611178840000, 3, 0, '2022-09-16 15:07:15', 1),
(76, 5088611178840000, 3, 0, '2022-09-16 15:07:19', 1),
(77, 5088611178840000, 3, 0, '2022-09-16 15:07:28', 1),
(78, 5088611178840000, 1, 10000, '2022-09-16 15:54:26', 1),
(79, 5088611178840000, 2, 1000, '2022-09-16 15:55:28', 1),
(80, 5088611178840000, 3, 0, '2022-09-16 15:55:58', 1),
(81, 5088611178840000, 3, 0, '2022-09-16 15:56:46', 1),
(82, 5088611178840000, 3, 0, '2022-09-16 15:57:09', 1),
(83, 5088611178840000, 2, 8388607, '2022-09-16 16:01:09', 0),
(84, 5088611178840000, 1, 20000, '2022-09-16 16:04:11', 1),
(85, 5088611178840004, 1, 100, '2022-09-16 16:06:10', 1),
(86, 5088611178840004, 2, 5900, '2022-09-16 16:33:20', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `card_number` (`card_number`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_number` (`card_number`),
  ADD KEY `card_status` (`card_status`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `statustype`
--
ALTER TABLE `statustype`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `card_number` (`card_number`),
  ADD KEY `operation` (`operation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`card_number`) REFERENCES `card` (`card_number`);

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`card_status`) REFERENCES `statustype` (`status_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`card_number`) REFERENCES `card` (`card_number`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`operation`) REFERENCES `operations` (`operation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
