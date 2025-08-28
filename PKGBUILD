# Maintainer: Martin Rys <https://rys.rs/contact>

_pkgname=libqpsd
pkgname=libqpsd-qt6
pkgver=2.3.0
pkgrel=2
pkgdesc='PSD & PSB Plugin for Qt/C++ (Qt6)'
arch=('x86_64')
url="https://github.com/roniemartinez/libqpsd"
license=('LGPL-2.1-only')
depends=('qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roniemartinez/libqpsd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2eb23da9b502fadbf92231c3be5fa9090c489f31c60ea96f69a5f62aa681f06')


prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -i "s|\$\$\[QT_INSTALL_PLUGINS\]|/usr/lib/qt6/plugins|" QPsdPlugin.pro

	mkdir build
	cd build
	/usr/lib/qt6/bin/qmake ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"

	make INSTALL_ROOT="${pkgdir}" install
	install -d "${pkgdir}/usr/include/libqpsd"
	cp -r ../*.h "${pkgdir}/usr/include/libqpsd"

	# This is very shabby, needs redoing, I don't know how to cmake, but it gets nomacs build progress a little bit further
	#install -d "${pkgdir}/usr/lib/cmake/libqpsd"
	#echo 'file(GLOB LIBQPSD_HEADERS "/usr/include/libqpsd/*.h")' > "${pkgdir}/usr/lib/cmake/libqpsd/libqpsdConfig.cmake"
	#echo 'set(LIBQPSD_FOUND TRUE)' >> "${pkgdir}/usr/lib/cmake/libqpsd/libqpsdConfig.cmake"
}
