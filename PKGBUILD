pkgname=mingw-w64-coin-or-blis
pkgver=0.93.11
pkgrel=1
pkgdesc="BLIS (BiCePS Linear Integer Solver) (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CHiPPS"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-or-bcps')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/pkgsource/CHiPPS/Blis-${pkgver}.tgz")
sha1sums=('2ba385b5d3706d55f36e7a12f7e22a0fbbd6210d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Blis-$pkgver"
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
              --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/${_arch}/include/coin/" -C
    make
    popd
  done
}

package() {
  #cd "$srcdir/Blis-$pkgver"
  #PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  #make DESTDIR="$pkgdir/" install

  for _arch in ${_architectures}; do
    cd "$srcdir"/Blis-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

}

