# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-fribidi
pkgver=0.19.7
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)"
arch=('any')
license=('LGPL')
url="http://fribidi.org"
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=("http://fribidi.org/download/fribidi-${pkgver}.tar.bz2")
md5sums=('6c7e7cfdd39c908f7ac619351c1c5c23')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/fribidi-${pkgver}/build-${_arch} && cd ${srcdir}/fribidi-${pkgver}/build-${_arch}

    ${_arch}-configure    

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/fribidi-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r ${pkgdir}/usr/${_arch}/share
  done
}
