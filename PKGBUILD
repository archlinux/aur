pkgname=mingw-w64-gmp
pkgver=6.1.2
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (mingw-w64)"
arch=(any)
url="http://gmplib.org"
license=("LGPL3")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure wine)
options=(staticlibs !strip !buildflags)
source=("https://gmplib.org/download/gmp/gmp-${pkgver}.tar.xz" exeext.patch)
sha256sums=('87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/gmp-${pkgver}"

  # detect correct exe extension, use it for code generation
  patch -p1 -i "${srcdir}"/exeext.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/gmp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-cxx \
      --disable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gmp-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
  done
}


