pkgname=mingw-w64-gmp
pkgver=6.0.0
pkgrel=2
pkgdesc="A free library for arbitrary precision arithmetic (mingw-w64)"
arch=(any)
url="http://gmplib.org"
license=("LGPL3")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("ftp://ftp.gmplib.org/pub/gmp-${pkgver}/gmp-${pkgver}.tar.xz")
md5sums=('4dc314ac6d3059cc8d712aad4a6d162e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gmp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-cxx \
      --disable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gmp-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
  done
}


