
pkgname=mingw-w64-coin-or-osi
pkgver=0.108.4
pkgrel=1
pkgdesc="COIN-OR Open Solver Interface (mingw-w64)"
arch=(any)
url="https://projects.coin-or.org/Osi"
license=(EPL)
groups=(coin-or)
depends=(mingw-w64-coin-or-coinutils)
makedepends=(mingw-w64-gcc)
options=('!buildflags' '!strip' 'staticlibs')
source=("https://www.coin-or.org/download/source/Osi/Osi-${pkgver}.tgz")
sha256sums=('45a72e7019d33b9cf9c3f9fde30a9cb1e822e3b6897239c7dd67bc0060837c8d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Osi-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure --enable-dependency-linking \
                      --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                      --with-coinutils-incdir="/usr/${_arch}/include/coin/" ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Osi-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
  done
}
