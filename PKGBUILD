pkgname=mingw-w64-coin-or-dylp
pkgver=1.10.0
pkgrel=1
pkgdesc="COIN-OR Linear programming solver using of the dynamic simplex algorithm (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/DyLP"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-osi')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/DyLP/DyLP-${pkgver}.zip")
sha1sums=('7c27fb7735a64c92e68fba3e697ded07b91f95bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd DyLP-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
                --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
                --with-osi-incdir="/usr/${_arch}/include/coin/" \
                --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                --with-coinutils-incdir="/usr/${_arch}/include/coin/" -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/DyLP-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
#     rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
