# Maintainer: Joshua Rubin <me at jawa dot dev>
# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=jtdx
pkgver=2.2.159
pkgrel=2
pkgdesc='For amateur radio communication using very weak signals. Forked from WSJT-X.'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdx'
license=('GPL3')

depends=(
    'fftw'
    'hamlib>=4.5'
    'libusb'
    'portaudio'
    'qt5-base'
    'qt5-multimedia'
    'qt5-serialport'
    'qt5-tools'
    'qt5-websockets'
    'readline'
)

makedepends=(
    'cmake'
    'asciidoc'
    'asciidoctor'
    'boost'
    'gcc-fortran'
    'git'
    'texinfo'
)

provides=('jtdx')
conflicts=('jtdx-improved' 'jtdx-improved-jtdxgui')
source=("${pkgname%-git}::git://git.code.sf.net/p/jtdx/code")
md5sums=('SKIP')
sha1sums=('SKIP')

prepare() {
    mkdir -p "$srcdir"/${pkgname%-git}/jtdx-prefix/build
}

build() {
    cd "$srcdir"/${pkgname%-git}/jtdx-prefix/build
	cmake \
        -Wno-dev \
        -DCMAKE_PREFIX_PATH="$srcdir"/${pkgname%-git}/hamlib-prefix \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWSJT_SKIP_MANPAGES=ON \
        -DWSJT_GENERATE_DOCS=OFF \
        "$srcdir"/${pkgname%-git}
    make || return 1
}

package() {
  cd "$srcdir"/${pkgname%-git}/jtdx-prefix/build
  make DESTDIR=${pkgdir} install
}
