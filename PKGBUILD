# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-libuecc
pkgver=4
pkgrel=1
arch=(any)
pkgdesc="Very small Elliptic Curve Cryptography library (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=("BSD")
url="http://git.universe-factory.net/libuecc"
source=("http://git.universe-factory.net/libuecc/snapshot/libuecc-${pkgver}.tar")
md5sums=('81aa8c98442c3d93758fd62c8a9368b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libuecc-$pkgver"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libuecc-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
