# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=2.9.4-beta
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='An easy to use screencast creator'
arch=('i686' 'x86_64')
url='http://linuxecke.volkoh.de/vokoscreen/vokoscreen.html'
license=('GPL2')

depends=(
	'qt5-x11extras' 'qt5-multimedia' 'qt-gstreamer'
	'gst-plugins-good' 'gst-plugins-bad' 'pulseaudio-alsa'
)
makedepends=('qt5-tools' 'libxrandr')
optdepends=('gst-plugins-ugly: for x264 video codec')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"${pkgname}-${_pkgver}.tar.gz::https://github.com/vkohaupt/${pkgname}NG/archive/${_pkgver}.tar.gz"
	'fix_window_position.patch'
	'install.pri'
)
sha512sums=(
	'ef4392e2727e2e578e0dc0c0bcdfb1eec4c43a549961963375035222ba088f407a95f00b995f717d5ff8d07a60ce6a23a6b9151bb8b0957db77f1170c2b04f74'
	'535e9284122067135a70d27bd4f6d63e1b25936542b25d42c2726c4b944c7da77d5c5f9286c965d07d8026828fdc94d38d53c101116d37f2bb1d869618748a7d'
	'0a5e0523adaa9e7f9b46cbbc8f7d8d0167787b67f11cfb7895785e3f93ab8836526c1b0891f4bf3362f4e8bc44885ffcf99670b86558aa667bd4f4ac7df56f11'
)

prepare() {
	cd "${srcdir}"/${pkgname}NG-${_pkgver}

	# Fix window position
	patch -Np1 < ../fix_window_position.patch

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
