# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=mingw-w64-libconfig
pkgver=1.7.2
pkgrel=1
pkgdesc="C/C++ Configuration File Library (mingw-w64)"
arch=(any)
url="http://hyperrealm.github.io/libconfig"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("http://hyperrealm.github.io/libconfig/dist/${pkgname#mingw-w64-}-${pkgver}.tar.gz")
md5sums=('6bd98ee3a6e6b9126c82c916d7a9e690')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${pkgname#mingw-w64-}-$pkgver"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-examples ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
  	cd "$srcdir/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir/usr/${_arch}/share/info/dir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share/info"
  done
}
