pkgname=mingw-w64-coin-or-osi
pkgver=0.108.11
pkgrel=1
pkgdesc="COIN-OR Open Solver Interface (mingw-w64)"
arch=(any)
url="https://projects.coin-or.org/Osi"
license=(EPL)
groups=(mingw-w64-coin-or)
depends=(mingw-w64-coin-or-coinutils)
makedepends=(mingw-w64-configure)
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/coin-or/Osi/archive/refs/tags/releases/$pkgver.tar.gz")
sha256sums=('1063b6a057e80222e2ede3ef0c73c0c54697e0fee1d913e2bef530310c13a670')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Osi-releases-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
      --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
      --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Osi-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
