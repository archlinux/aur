pkgname=mingw-w64-coin-or-clp
pkgver=1.17.8
pkgrel=2
pkgdesc="COIN-OR linear programming solver (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Clp"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-osi' 'mingw-w64-coin-or-asl')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/coin-or/Clp/archive/releases/${pkgver}.tar.gz")
sha256sums=('f9931b5ba44f0daf445c6b48fc2c250dc12e667e59ace8ea7b025f158fe31556')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Clp-releases-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    LDFLAGS="-lssp" ${_arch}-configure \
      --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
      --with-osi-incdir="/usr/${_arch}/include/coin/" \
      --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
      --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Clp-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
