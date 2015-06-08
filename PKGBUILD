pkgname=mingw-w64-coin-or-osi
pkgver=0.107.4
pkgrel=1
pkgdesc="COIN-OR Open Solver Interface (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Osi"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-coinutils')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Osi/Osi-${pkgver}.tgz")
sha1sums=('c1496835a98791a86eabadd8aead96719690d701')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Osi-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
                 --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                 --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
                 -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Osi-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
