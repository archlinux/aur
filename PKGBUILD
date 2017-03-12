
pkgname=mingw-w64-coin-or-coinutils
pkgver=2.10.13
pkgrel=1
pkgdesc="COIN-OR collection of utility classes (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CoinUtils"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-bzip2' 'mingw-w64-zlib' 'mingw-w64-lapack' 'mingw-w64-glpk')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/CoinUtils/CoinUtils-${pkgver}.tgz")
sha1sums=('3440708a8c67b026ae63726a7d02a2d78a3b6eb4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd CoinUtils-$pkgver
}


build() {
  cd "$srcdir"/CoinUtils-$pkgver
  #sed -i "70ilibCoinUtils_la_LIBADD = -lbz2 -lz -llapack -lblas" CoinUtils/src/Makefile.in
  #sed -i "424ilibCoinUtils_la_LDFLAGS += -no-undefined" CoinUtils/src/Makefile.in
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --with-blas-lib='-lblas' --with-lapack-lib='-llapack' --with-glpk-lib='-lglpk' --enable-dependency-linking 
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/CoinUtils-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
