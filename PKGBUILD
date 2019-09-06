
pkgname=mingw-w64-coin-or-vol
pkgver=1.5.4
pkgrel=1
pkgdesc="COIN-OR Volume Algorithm (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-coin-or-osi')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Vol/Vol-${pkgver}.tgz")
sha256sums=('dbcd822cb42c596990444c9db8b65e77ec71f98c8550e1212f9e8c1a7cba6930')

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
      --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
      lt_cv_deplibs_check_method=pass_all ..
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
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
