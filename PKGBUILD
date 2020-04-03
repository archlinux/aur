# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgver=3.0.3
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
sha512sums=('621b5b8cc7498805f507a8635793c6e65c5564c3a9b4482efee40aef9c1bbf72273768d00cba769a2028c944dbb3159e191cff9bf642b52ced4b41ec4b80aaf2'
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
