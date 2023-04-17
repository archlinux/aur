pkgname=mingw-w64-coin-or-couenne
pkgver=0.5.8
pkgrel=1
pkgdesc="Convex Over and Under Envelopes for Nonlinear Estimation (mingw-w64)"
arch=('any')
url="https://github.com/coin-or/Couenne"
license=('EPL')
depends=('mingw-w64-coin-or-bonmin')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("Couenne-${pkgver}.tar.gz::https://github.com/coin-or/Couenne/archive/releases/${pkgver}.tar.gz")
sha256sums=('73b36e7475910f576ca25f8323553b9d5201fcb2656cef0a2c72e69dc0681051')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/Couenne-releases-$pkgver"
  curl -L https://github.com/coin-or/Couenne/commit/fdfe17562c59518b4db478ca51c18ab5e01a59a5.patch  | patch -p1 -d Couenne
}

build() {
  cd "$srcdir/Couenne-releases-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    LIBS="-lssp" ${_arch}-configure \
       --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
       --with-osi-incdir="/usr/${_arch}/include/coin/" \
       --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
       --with-clp-incdir="/usr/${_arch}/include/coin/" \
       --with-cgl-lib="$(${_arch}-pkg-config --libs cgl)" \
       --with-cgl-incdir="/usr/${_arch}/include/coin/" \
       --with-vol-lib="$(${_arch}-pkg-config --libs vol)" \
       --with-vol-incdir="/usr/${_arch}/include/coin/" \
       --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
       --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
       --with-bcp-lib="$(${_arch}-pkg-config --libs bcp)" \
       --with-bcp-incdir="/usr/${_arch}/include/coin/" \
       --with-cbc-lib="$(${_arch}-pkg-config --libs cbc)" \
       --with-cbc-incdir="/usr/${_arch}/include/coin/" \
       --with-ipopt-lib="$(${_arch}-pkg-config --libs ipopt)" \
       --with-ipopt-incdir="/usr/${_arch}/include/coin/" \
       --with-bonmin-lib="$(${_arch}-pkg-config --libs bonmin bonminamplinterface)" \
       --with-bonmin-incdir="/usr/${_arch}/include/coin/" \
       lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Couenne-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

