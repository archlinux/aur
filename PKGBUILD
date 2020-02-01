pkgname=mingw-w64-coin-or-cgl
pkgver=0.60.3
pkgrel=1
pkgdesc="COIN-OR Cut Generation Library (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Cgl"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-clp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Cgl/Cgl-${pkgver}.tgz")
sha256sums=('cf11e3476d2182040cec412abb232d8bafa12ff5b619eca3b7b9ac1d220476c8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Cgl-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    LIBS="-lssp" ${_arch}-configure \
      --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
      --with-osi-incdir="/usr/${_arch}/include/coin/" \
      --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
      --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
      --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
      --with-clp-incdir="/usr/${_arch}/include/coin/" \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Cgl-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
