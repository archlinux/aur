# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=jtdx-improved
_pkgname=jtdx
pkgver=2.2.159
pkgrel=2
pkgdesc="For amateur radio communication using very weak signals. Forked from WSJT-X. JTDX Improved by DG2YCB"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/jtdx-improved/"
license=('GPL3')

depends=(
	'fftw'
	'hamlib>=4.5'
	'libusb'
	'qt5-base'
	'qt5-multimedia'
	'qt5-serialport'
	'qt5-tools'
	'qt5-websockets'
	'readline'
)

makedepends=(
	'cmake'
	'boost'
	'gcc-fortran'
)

install=jtdx-improved.install

provides=('jtdx')
conflicts=('jtdx' 'jtdx-improved-jtdxgui')
source=("https://downloads.sourceforge.net/project/jtdx-improved/${_pkgname}_${pkgver}/Source%20code/${_pkgname}_${pkgver}_improved_source.zip")
md5sums=('539cfd3092b5a04977ed204166355f86')
sha1sums=('5a9b2b22243e0f511fb6472d913ee277714e7447')

prepare() {
    sed -i 's|$ENV{HOME}|$ENV{DESTDIR}/opt/${CMAKE_PROJECT_NAME}|' $_pkgname/CMakeLists.txt
}

build() {
    cd "$srcdir"
	cmake -B build -S "$_pkgname" \
        -Wno-dev \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=Release \
        -D WSJT_SKIP_MANPAGES=ON \
        -D WSJT_GENERATE_DOCS=OFF
    cmake --build build
}

package() {
    DESTDIR=${pkgdir} cmake --install build
}

