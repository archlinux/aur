# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=jtdx-improved-jtdxgui
_pkgname=jtdx
pkgver=2.2.159
pkgrel=2
pkgdesc="For amateur radio communication using very weak signals. Forked from WSJT-X. JTDX Improved by DG2YCB (With JTDX GUI)"
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
	'git'
)

install=jtdx-improved.install

provides=('jtdx')
conflicts=('jtdx' 'jtdx-improved')
source=("https://downloads.sourceforge.net/project/jtdx-improved/${_pkgname}_${pkgver}/Source%20code/${_pkgname}_${pkgver}_improved_with_JTDX_GUI_source.zip")
md5sums=('9f7bfb9be63be3b16af6e726b8cee33b')
sha1sums=('bef3aaf3d8dc8a47ff51db7073ddd6cfe19df428')

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

