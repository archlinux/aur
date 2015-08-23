# $Id$
# Maintainer Jens Staal <staal1978@gmail.com>
# adopted from official libxau package:
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=mingw-w64-libxau
pkgver=1.0.8
pkgrel=1
pkgdesc="X11 authorisation library (mingw-w64)"
arch=('any')
url="http://xorg.freedesktop.org/"
depends=('mingw-w64-crt' 'mingw-w64-xproto')
makedepends=('pkgconfig' 'mingw-w64-configure' 'mingw-w64-gcc')
license=('custom')
source=(${url}/releases/individual/lib/libXau-${pkgver}.tar.bz2)
sha256sums=('fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2')
options=('!strip' 'staticlibs' '!buildflags')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libXau-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    export CXXFLAGS=$CFLAGS
    export LDFLAGS="$LDFLAGS -lssp"
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  cd libXau-${pkgver}
  for _arch in ${_architectures}; do
    cd "${srcdir}/libXau-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -f "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
} 
