# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=mingw-w64-liblo
pkgver=0.31
pkgrel=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation (mingw-w64)"
arch=('any')
url="http://liblo.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/liblo/liblo-0.31.tar.gz")
sha512sums=('97f9561296c2e53f92db0cfee625687208b490f8bc229b6cffe88b43ca2a8da1ed3217aaa2151245ea483e54ad6c5e92b9cf10a20661766fa6d3bedb5a8cdd01')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export CFLAGS="-Wno-error"
  cd "${srcdir}/${pkgname##*-}-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname##*-}-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
