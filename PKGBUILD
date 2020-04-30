pkgname=mingw-w64-coin-or-ipopt
pkgver=3.13.2
pkgrel=1
pkgdesc="Interior Point OPTimizer (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Ipopt"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-lapack' 'mingw-w64-coin-or-asl' 'mingw-w64-coin-or-coinmumps')
makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'wget')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/coin-or/Ipopt/archive/releases/${pkgver}.tar.gz")
sha256sums=('891ab9e9c7db29fc8ac5c779ccec6313301098de7bbf735ca230cd5544c49496')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/Ipopt-releases-$pkgver"
}

build() {
  cd "$srcdir/Ipopt-releases-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-blas-incdir=/usr/${_arch}/include --with-blas-lib="-lblas" \
      --with-lapack-incdir=/usr/${_arch}/include --with-lapack-lib="-llapack" \
      lt_cv_deplibs_check_method=pass_all --without-hsl --disable-java ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Ipopt-releases-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir"/ install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    # for compatibility
    install -d "$pkgdir"/usr/${_arch}/include/coin
    cp -r "$pkgdir"/usr/${_arch}/include/coin-or/* "$pkgdir"/usr/${_arch}/include/coin
  done
}

