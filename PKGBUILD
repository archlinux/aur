
pkgname=mingw-w64-libdvdcss
pkgver=1.3.0
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (mingw-w64)"
url="http://www.videolan.org/libdvdcss"
arch=('any')
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(http://download.videolan.org/pub/libdvdcss/$pkgver/libdvdcss-$pkgver.tar.bz2)
sha1sums=('b3ccd70a510aa04d644f32b398489a3122a7e11a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libdvdcss-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/libdvdcss-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
