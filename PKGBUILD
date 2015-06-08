pkgname=mingw-w64-libmpc
pkgver=1.0.3
pkgrel=1
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision (mingw-w64)"
arch=(any)
url="http://www.multiprecision.org"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-mpfr)
options=(!libtool !strip !buildflags)
source=("http://www.multiprecision.org/mpc/download/mpc-${pkgver/_/-}.tar.gz"{,.sig})
md5sums=('d6a1d5f8ddea3abd2cc3e98f58352d26'
         'SKIP')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd mpc-${pkgver}
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    $_arch-configure \
      --enable-shared \
      --disable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpc-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
