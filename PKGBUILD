
pkgname=mingw-w64-coin-or-coinutils
pkgver=2.11.2
pkgrel=1
pkgdesc="COIN-OR collection of utility classes (mingw-w64)"
arch=(any)
url="https://projects.coin-or.org/CoinUtils"
license=(EPL)
depends=(mingw-w64-zlib mingw-w64-bzip2 mingw-w64-glpk mingw-w64-lapack)
makedepends=(mingw-w64-configure)
options=('!buildflags' '!strip' 'staticlibs')
groups=(coin-or)
source=("https://www.coin-or.org/download/source/CoinUtils/CoinUtils-$pkgver.tgz")
sha256sums=('23e955e5c02f2ccc9db9561f4f803ef76e976cf4aed54cea2973eedbffc79ad8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd CoinUtils-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure --with-blas-lib='-lblas' --with-lapack-lib='-llapack' --with-glpk-lib='-lglpk' --enable-dependency-linking ..
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
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
