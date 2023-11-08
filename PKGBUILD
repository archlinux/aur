pkgname=mingw-w64-coin-or-ipopt
pkgver=3.14.13
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
sha256sums=('2afcb057e7cf8ed7e07f50ee0a4a06d2e4d39e0f964777e9dd55fe56199a5e0a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/Ipopt-releases-$pkgver"
}

build() {
  cd "$srcdir/Ipopt-releases-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS="-lssp" ${_arch}-configure \
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

