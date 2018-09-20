-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2018 a las 14:21:44
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bestiapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombre_categoria` varchar(15) NOT NULL,
  `descripcion` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre_categoria`, `descripcion`) VALUES
('Comida', 'Encuentra la mejor comida para tu mascota'),
('Jueguetes', ' Encuentra los mejores y mas entretenidos jueguetes  '),
('Salud', ' veterinario mas cercano esta mas cerca de lo que crees');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `clave_dom` mediumint(9) NOT NULL,
  `colonia` varchar(35) NOT NULL,
  `calle` varchar(25) NOT NULL,
  `numero` mediumint(9) NOT NULL,
  `codigopostal` mediumint(9) NOT NULL,
  `tipo` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`clave_dom`, `colonia`, `calle`, `numero`, `codigopostal`, `tipo`) VALUES
(1, 'las rosas', 'mixtecos', 3, 45900, b'01'),
(2, 'oblatos', 'nueva zelanda', 345, 45600, b'00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `nombre_establecimiento` varchar(35) NOT NULL,
  `descripcion_est` tinytext NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `domicilio_est` mediumint(9) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `password_esteblecimiento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `pin` int(11) NOT NULL,
  `nombre_mascota` varchar(15) NOT NULL,
  `fecha_nac` date NOT NULL,
  `notas` text NOT NULL,
  `estado` smallint(6) NOT NULL,
  `gps` bit(2) NOT NULL,
  `responsable` varchar(15) NOT NULL,
  `raza` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` mediumint(9) NOT NULL,
  `nombre_promocion` varchar(50) NOT NULL,
  `descuento` tinyint(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `imagen_promocional` blob NOT NULL,
  `establecimiento` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `nombre_raza` varchar(50) NOT NULL,
  `peso_hem` tinyint(4) NOT NULL,
  `peso_mac` tinyint(4) NOT NULL,
  `altura_hem` tinyint(4) NOT NULL,
  `altura_mac` tinyint(4) NOT NULL,
  `caracter` text NOT NULL,
  `esp_vida` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`nombre_raza`, `peso_hem`, `peso_mac`, `altura_hem`, `altura_mac`, `caracter`, `esp_vida`) VALUES
('affenpinscher', 3, 4, 24, 28, 'extravagante y reservado. Divertido y a veces travieso, el Affenpinscher es una antigua raza de Europa central. Con la cara y la naturaleza traviesa de un mono, esta raza es extremadamente leal y cariñoso hacia su familia, aunque audaz para los agresores. Ideal para los apartamentos, sus necesidades de ejercicio se puede satisfacer con el juego de interior, así como con paseos diarios. Su pelaje debe ser cepillado dos veces por semana y recortado dos veces al año.', 13),
('Afghan Hound', 20, 27, 61, 74, 'Una raza digna y a menudo considerada de la aristocracia, el perro afgano tiene un temperamento feliz y es un compañero excelente de la familia. Poco se sabe sobre la historia del perro afgano antes del siglo 19 cuando fue descubierto en Afganistán. Un perro de raza grande como es el afgano necesita realizar ejercicio regularmente, y su pelaje largo y sedoso requiere un cepillado diario.', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_vacunas`
--

CREATE TABLE `registro_vacunas` (
  `folio_vacuna` smallint(6) NOT NULL,
  `fecha` date NOT NULL,
  `vacuna` tinyint(4) NOT NULL,
  `aplicante` smallint(6) NOT NULL,
  `mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_productos`
--

CREATE TABLE `servicios_productos` (
  `codigo_producto` int(11) NOT NULL,
  `titulo_nombre` varchar(35) NOT NULL,
  `descripcion_producto` tinytext NOT NULL,
  `precio_producto` int(11) NOT NULL,
  `foto_producto` blob NOT NULL,
  `promociones` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario-app`
--

CREATE TABLE `usuario-app` (
  `nombre_usuario` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ap_paterno` varchar(15) NOT NULL,
  `ap_materno` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `fecha_nac` date NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `domicilio` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario-app`
--

INSERT INTO `usuario-app` (`nombre_usuario`, `nombre`, `ap_paterno`, `ap_materno`, `password`, `correo`, `fecha_nac`, `telefono`, `domicilio`) VALUES
('caballero666', 'daniel', 'reinoso', 'davila', 'password', 'danilol@yahoo.com', '1996-01-01', '3300331166', 1),
('mojajoja', 'daniela', 'reinoso', 'davila', 'password', 'danalol@yahoo.com', '1998-01-02', '3334890034', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `codigo_vacuna` tinyint(4) NOT NULL,
  `nombre_vacuna` varchar(35) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_apartado`
--

CREATE TABLE `venta_apartado` (
  `folio_apartado` mediumint(9) NOT NULL,
  `fecha_apartado` date NOT NULL,
  `fecha_venta_final` date NOT NULL,
  `monto_a_contemplar` int(11) NOT NULL,
  `producto_venta` int(11) NOT NULL,
  `establecimiento_encargado` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `clave` smallint(6) NOT NULL,
  `nombre_veterinario` varchar(35) NOT NULL,
  `ap_paterno` varchar(15) NOT NULL,
  `ap_materno` varchar(15) NOT NULL,
  `titulo_especialidad` varchar(50) NOT NULL,
  `institucion_avalacion` varchar(50) NOT NULL,
  `titulo_certificado` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombre_categoria`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`clave_dom`);

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`nombre_establecimiento`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `domicilio_est` (`domicilio_est`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`pin`),
  ADD KEY `responsable` (`responsable`),
  ADD KEY `raza` (`raza`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`),
  ADD KEY `establecimiento` (`establecimiento`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`nombre_raza`);

--
-- Indices de la tabla `registro_vacunas`
--
ALTER TABLE `registro_vacunas`
  ADD PRIMARY KEY (`folio_vacuna`),
  ADD KEY `vacuna` (`vacuna`),
  ADD KEY `aplicante` (`aplicante`),
  ADD KEY `mascota` (`mascota`);

--
-- Indices de la tabla `servicios_productos`
--
ALTER TABLE `servicios_productos`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `promociones` (`promociones`);

--
-- Indices de la tabla `usuario-app`
--
ALTER TABLE `usuario-app`
  ADD PRIMARY KEY (`nombre_usuario`),
  ADD KEY `domicilio` (`domicilio`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`codigo_vacuna`);

--
-- Indices de la tabla `venta_apartado`
--
ALTER TABLE `venta_apartado`
  ADD PRIMARY KEY (`folio_apartado`),
  ADD KEY `producto_venta` (`producto_venta`),
  ADD KEY `establecimiento_encargado` (`establecimiento_encargado`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`clave`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `clave_dom` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD CONSTRAINT `establecimiento_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre_categoria`),
  ADD CONSTRAINT `establecimiento_ibfk_2` FOREIGN KEY (`domicilio_est`) REFERENCES `domicilio` (`clave_dom`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`responsable`) REFERENCES `usuario-app` (`nombre_usuario`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`raza`) REFERENCES `raza` (`nombre_raza`);

--
-- Filtros para la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`establecimiento`) REFERENCES `establecimiento` (`nombre_establecimiento`);

--
-- Filtros para la tabla `registro_vacunas`
--
ALTER TABLE `registro_vacunas`
  ADD CONSTRAINT `registro_vacunas_ibfk_1` FOREIGN KEY (`vacuna`) REFERENCES `vacunas` (`codigo_vacuna`),
  ADD CONSTRAINT `registro_vacunas_ibfk_2` FOREIGN KEY (`aplicante`) REFERENCES `veterinario` (`clave`),
  ADD CONSTRAINT `registro_vacunas_ibfk_3` FOREIGN KEY (`mascota`) REFERENCES `mascotas` (`pin`);

--
-- Filtros para la tabla `servicios_productos`
--
ALTER TABLE `servicios_productos`
  ADD CONSTRAINT `servicios_productos_ibfk_1` FOREIGN KEY (`promociones`) REFERENCES `promociones` (`id_promocion`);

--
-- Filtros para la tabla `usuario-app`
--
ALTER TABLE `usuario-app`
  ADD CONSTRAINT `usuario-app_ibfk_1` FOREIGN KEY (`domicilio`) REFERENCES `domicilio` (`clave_dom`);

--
-- Filtros para la tabla `venta_apartado`
--
ALTER TABLE `venta_apartado`
  ADD CONSTRAINT `venta_apartado_ibfk_1` FOREIGN KEY (`producto_venta`) REFERENCES `servicios_productos` (`codigo_producto`),
  ADD CONSTRAINT `venta_apartado_ibfk_2` FOREIGN KEY (`establecimiento_encargado`) REFERENCES `establecimiento` (`nombre_establecimiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
