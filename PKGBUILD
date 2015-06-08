pkgname=mingw-w64-coin-or-bcps
pkgver=0.94.0
pkgrel=1
pkgdesc="Part of the COIN High Performance Parallel Search Framework (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CHiPPS"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-alps')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/pkgsource/CHiPPS/Bcps-${pkgver}.tgz")
sha1sums=('987834b7fa53eb2e8badf5429dabf71cec7225a6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Bcps-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}  
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
              --with-alps-lib="$(${_arch}-pkg-config --libs alps)" \
              --with-alps-incdir="/usr/${_arch}/include/coin/" \
              --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
              --with-osi-incdir="/usr/${_arch}/include/coin/" \
              --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
              --with-clp-incdir="/usr/${_arch}/include/coin/" \
              --with-cgl-lib="$(${_arch}-pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/${_arch}/include/coin/" \
              --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/${_arch}/include/coin/" -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Bcps-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

