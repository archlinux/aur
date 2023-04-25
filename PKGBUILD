pkgname=mingw-w64-coin-or-bonmin
pkgver=1.8.9
pkgrel=1
pkgdesc="Experimental open-source C++ code for solving general MINLP problems (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Bonmin"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-cbc' 'mingw-w64-coin-or-ipopt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/coin-or/Bonmin/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('8d130430a2776e250e941ee16f51dba301d5f0a00cc288e05f5b985cf1f426cd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  # see mingw-w64-coin-or-pkg-config
  sed -i "s|export PKG_CONFIG_PATH|export PKG_CONFIG_PATH_CUSTOM|g" Bonmin/configure
  sed -i "s| PKG_CONFIG_PATH=| PKG_CONFIG_PATH_CUSTOM=|g" Bonmin/configure
}

build() {
  cd "$srcdir/Bonmin-releases-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS="-lssp" ${_arch}-configure \
       --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
       --with-osi-incdir="/usr/${_arch}/include/coin/" \
       --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
       --with-clp-incdir="/usr/${_arch}/include/coin/" \
       --with-cgl-lib="$(${_arch}-pkg-config --libs cgl)" \
       --with-cgl-incdir="/usr/${_arch}/include/coin/" \
       --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
       --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
       --with-cbc-lib="$(${_arch}-pkg-config --libs cbc)" \
       --with-cbc-incdir="/usr/${_arch}/include/coin/" \
       --with-ipopt-lib="$(${_arch}-pkg-config --libs ipopt)" \
       --with-ipopt-incdir="/usr/${_arch}/include/coin/" \
       lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Bonmin-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

