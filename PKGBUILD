# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=3.0.4
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='An easy to use screencast creator'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=(
	'qt5-x11extras' 'qt5-multimedia' 'qt-gstreamer'
	'gst-plugins-good' 'gst-plugins-bad' 'pulseaudio'
        'zbar'
)
makedepends=('qt5-tools' 'libxrandr')
optdepends=('gst-plugins-ugly: for x264 video codec')

source=(
	"${pkgname}-${_pkgver}.tar.gz::https://github.com/vkohaupt/${pkgname}NG/archive/${_pkgver}.tar.gz"
	'install.pri'
)
sha512sums=('4fe8716f93d3e4e2cac7508de1b4912870637628b6aa8c58a2821b86b1dd2d1bcbaf251f956baf900bd71d6e58bc33e0d017dfb4c8f90fbcd0cba8d43b973c9b'
            '55b27e0eb5f0f1f1193057c854666ccaea6df89d090239e58a0b8fe6c8749d9d2ca3e80812ea7ecded22fdf75d7fd8a0699e8dbeae6c93c97bc6b648f114e5f4')

prepare() {
	cd "${srcdir}"/${pkgname}NG-${_pkgver}

	# Add install instructions
	cp ../install.pri src/
	echo 'include(install.pri)' >> src/vokoscreenNG.pro

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	qmake-qt5 ../${pkgname}NG-${_pkgver}/src/vokoscreenNG.pro \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
