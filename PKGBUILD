# $Id$
# Maintainer Jens Staal <staal1978@gmail.com>
# adopted from official libxau package:
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=mingw-w64-libxau
_name=libXau
pkgver=1.0.8
pkgrel=1
pkgdesc="X11 authorisation library (mingw-w64)"
arch=('any')
url="https://xorg.freedesktop.org"
depends=('mingw-w64-crt' 'mingw-w64-xproto')
makedepends=('mingw-w64-pkg-config' 'mingw-w64-configure')
license=('custom')
source=("${_name}-${pkgver}.tar.bz2::${url}/releases/individual/lib/${_name}-${pkgver}.tar.bz2")
sha256sums=('fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2')
options=('!strip' 'staticlibs' '!buildflags')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -f "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    popd
  done
} 
