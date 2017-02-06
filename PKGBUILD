pkgname=mingw-w64-libidn2
pkgver=0.16
pkgrel=1
pkgdesc="A free software implementation of IDNA2008 (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libidn"
license=("GPL3, LGPL3")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libunistring)
options=(staticlibs !strip !buildflags)
source=("http://alpha.gnu.org/gnu/libidn/libidn2-${pkgver}.tar.gz"
        libidn2-mingw.patch)
sha1sums=('26311b538897a8ed0569922132f2139ee3ec6a28'
          SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libidn2-${pkgver}"
  # undefined refs to getline, error
  patch -p1 -i "${srcdir}"/libidn2-mingw.patch
  # do not build tr46map_data.c/gentr46map.c
  sed -i "66,71d" Makefile.am
  # disable doc
  sed -i "s|src doc|src|g" Makefile.am
  autoreconf -vfi
}

build() {
  cd "${srcdir}/libidn2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-nls
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libidn2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
