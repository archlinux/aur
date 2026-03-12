pkgname=mingw-w64-coin-or-cbc
pkgver=2.10.13
pkgrel=1
pkgdesc="COIN-OR branch-and-cut mixed integer programming solver (mingw-w64)"
arch=('any')
url='https://github.com/coin-or/Cbc'
license=(EPL-2.0)
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-cgl')
makedepends=('mingw-w64-configure' 'mingw-w64-nauty')
options=('staticlibs' '!buildflags' '!strip')
source=(https://github.com/coin-or/Cbc/archive/refs/tags/releases/$pkgver.tar.gz)
sha256sums=('62fde44dcf6f3d05c5cd291d7435cdd1b7e8acd3c78ec481dd39fe49cbc40399')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd Cbc-releases-$pkgver
  # see mingw-w64-coin-or-pkg-config
  sed -i "s|export PKG_CONFIG_PATH|export PKG_CONFIG_PATH_CUSTOM|g" Cbc/configure
  sed -i "s| PKG_CONFIG_PATH=| PKG_CONFIG_PATH_CUSTOM=|g" Cbc/configure
}

build() {
  cd Cbc-releases-$pkgver
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
      --with-nauty-lib="-l:nautyS.a" --with-nauty-incdir=/usr/${_arch}/include/nauty \
      --disable-nauty-libcheck \
      lt_cv_deplibs_check_method=pass_all ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Cbc-releases-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    sed -i "s|/usr/${_arch}/lib/nauty.a||g" "$pkgdir"/usr/${_arch}/lib/pkgconfig/cbc.pc
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
