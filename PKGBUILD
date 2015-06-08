# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=mingw-w64-coin-or-vol
pkgver=1.5.0
pkgrel=1
pkgdesc="COIN-OR Volume Algorithm (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-osi')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Vol/Vol-${pkgver}.tgz")
sha1sums=('e53dd21eb28fb5a60ed39492d054cceafeb39ddf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Vol-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
              --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
              --with-osi-incdir="/usr/${_arch}/include/coin/" \
              --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/${_arch}/include/coin/"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Vol-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
