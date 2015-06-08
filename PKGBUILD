pkgname=mingw-w64-coin-or-bcp
pkgver=1.4.0
pkgrel=1
pkgdesc="COIN-OR parallel branch-cut-price algorithms for mixed-integer linear programs (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Bcp"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-cgl' 'mingw-w64-coin-or-clp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Bcp/Bcp-${pkgver}.tgz")
sha1sums=('addf63bda07f85ea6a6b16ff32088afd08a3b56e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Bcp-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
                --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
                --with-osi-incdir="/usr/${_arch}/include/coin/" \
                --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
                --with-clp-incdir="/usr/${_arch}/include/coin/" \
                --with-cgl-lib="$(${_arch}-pkg-config --libs cgl)" \
                --with-cgl-incdir="/usr/${_arch}/include/coin/" \
                --with-vol-lib="$(${_arch}-pkg-config --libs vol)" \
                --with-vol-incdir="/usr/${_arch}/include/coin/" \
                --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                --with-coinutils-incdir="/usr/${_arch}/include/coin/" -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Bcp-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
