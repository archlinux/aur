pkgname=mingw-w64-coin-or-coinutils
pkgver=2.11.6
pkgrel=1
pkgdesc="COIN-OR collection of utility classes (mingw-w64)"
arch=(any)
url="https://projects.coin-or.org/CoinUtils"
license=(EPL)
depends=(mingw-w64-zlib mingw-w64-bzip2 mingw-w64-glpk mingw-w64-lapack)
makedepends=(mingw-w64-configure)
options=('!buildflags' '!strip' 'staticlibs')
groups=(mingw-w64-coin-or)
source=("https://github.com/coin-or/CoinUtils/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('6ea31d5214f7eb27fa3ffb2bdad7ec96499dd2aaaeb4a7d0abd90ef852fc79ca')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd CoinUtils-releases-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    LIBS="-lssp" ${_arch}-configure --with-blas-lib='-lblas' --with-lapack-lib='-llapack' --with-glpk-lib='-lglpk' \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/CoinUtils-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
