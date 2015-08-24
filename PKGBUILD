# $Id$
# Maintainer: Jens Staal <staal1978@gmail.com>
# adopted from libxdmcp package:
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-libxdmcp
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 Display Manager Control Protocol library"
arch=('any')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('mingw-w64-xproto' 'mingw-w64-crt')
makedepends=('mingw-w64-xorg-util-macros' 'mingw-w64-gcc' 'mingw-w64-configure')
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.bz2)
sha256sums=('81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2')
options=('!strip' 'staticlibs' '!buildflags')

_architectures="i686-w64-mingw32" # x86_64-w64-mingw32 fails (type conflicts)

build() {
  cd libXdmcp-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    export CXXFLAGS=$CFLAGS
    export LDFLAGS="$LDFLAGS -lssp -lws2_32"
    ${_arch}-configure
    sed 's|LDFLAGS = |LDFLAGS = -lssp -lws2_32 |g' -i Makefile
    make 
    popd 
  done
}

package() {
  cd libXdmcp-${pkgver}
  for _arch in ${_architectures}; do
    cd "${srcdir}/libXdmcp-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -f "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
} 

