pkgname=mingw-w64-coin-or-cbc
pkgver=2.10.3
pkgrel=1
pkgdesc="COIN-OR branch-and-cut mixed integer programming solver (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Cbc"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-cgl' 'mingw-w64-coin-or-ipopt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Cbc/Cbc-${pkgver}.tgz")
sha256sums=('ad388357129497c1cc3be50c3707b1995fddf0a4188abc8e3669173f0179ecff')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd Cbc-$pkgver
  # see mingw-w64-coin-or-pkg-config
  sed -i "s|export PKG_CONFIG_PATH|export PKG_CONFIG_PATH_CUSTOM|g" Cbc/configure
  sed -i "s| PKG_CONFIG_PATH=| PKG_CONFIG_PATH_CUSTOM=|g" Cbc/configure
}

build() {
  cd Cbc-$pkgver
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
      --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
      --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Cbc-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
