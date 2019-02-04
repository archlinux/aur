pkgname=mingw-w64-coin-or-bonmin
pkgver=1.8.6
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-cbc' 'mingw-w64-coin-or-ipopt' 'mingw-w64-coin-or-bcp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.coin-or.org/download/source/Bonmin/Bonmin-$pkgver.tgz")
sha256sums=('7aa132403cd2a15f55f779df51e1f14a7272ed8de22ece0c40403b23819c2b71')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Bonmin-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-vol-lib="$(pkg-config --libs vol)" \
              --with-vol-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --with-bcp-lib="$(pkg-config --libs bcp)" \
              --with-bcp-incdir="/usr/include/coin/" \
              --with-cbc-lib="$(pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/include/coin/" \
              --with-ipopt-lib="$(pkg-config --libs ipopt)" \
              --with-ipopt-incdir="/usr/include/coin/" \
              ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Bonmin-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

