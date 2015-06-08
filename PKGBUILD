pkgname=mingw-w64-coin-or-coinmp
pkgver=1.8.0
pkgrel=1
pkgdesc="C-API library that supports most of the functionality of CLP (Coin LP), CBC (Coin Branch-and-Cut), and CGL (Cut Generation Library) projects (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CoinMP"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-cbc')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(http://www.coin-or.org/download/source/CoinMP/CoinMP-$pkgver.tgz)
sha1sums=('72fb7ee9ef7043f75ef1aac9bc9053cca321af3a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd CoinMP-$pkgver
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
              --with-cbc-lib="$(${_arch}-pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/${_arch}/include/coin/" \
              --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/${_arch}/include/coin/" -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/CoinMP-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r ${pkgdir}${pkgdir}/*
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
