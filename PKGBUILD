# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=2.9.5-beta
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='An easy to use screencast creator'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=(
	'qt5-x11extras' 'qt5-multimedia' 'qt-gstreamer'
	'gst-plugins-good' 'gst-plugins-bad' 'pulseaudio'
)
makedepends=('qt5-tools' 'libxrandr')
optdepends=('gst-plugins-ugly: for x264 video codec')

source=(
	"${pkgname}-${_pkgver}.tar.gz::https://github.com/vkohaupt/${pkgname}NG/archive/${_pkgver}.tar.gz"
	'install.pri'
)
sha512sums=(
	'21f1a4a21d61067373e406db7f6775fdf11c87c70f398172220d773358adc457fd8dc6ef40705690cae6ece26581385bea52ab9849b09273723a31efc67fc96f'
	'0a5e0523adaa9e7f9b46cbbc8f7d8d0167787b67f11cfb7895785e3f93ab8836526c1b0891f4bf3362f4e8bc44885ffcf99670b86558aa667bd4f4ac7df56f11'
)

prepare() {
	cd "${srcdir}"/${pkgname}NG-${_pkgver}

	# Add install instructions
	cp ../install.pri src/
	echo 'include(install.pri)' >> src/vokoscreen.pro

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	qmake-qt5 ../${pkgname}NG-${_pkgver}/src \
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
