pkgname=mingw-w64-gmp
pkgver=6.2.0
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (mingw-w64)"
arch=(any)
url="http://gmplib.org"
license=("LGPL3")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure wine)
options=(staticlibs !strip !buildflags)
source=(https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz{,.sig} exeext.patch)
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298')   # Niels Möller <nisse@lysator.liu.se>
sha256sums=('3f33f127bcb6b2c3601676cd3281df45824b148cbf688b73c0fc8248793667d9'
            'SKIP' 'SKIP')

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


