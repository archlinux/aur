pkgname=mingw-w64-freeglut
pkgver=3.4.0
pkgrel=1
pkgdesc="Provides functionality for small OpenGL programs (mingw-w64)"
arch=(any)
url="http://freeglut.sourceforge.net/"
license=("MIT")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz")
sha256sums=('3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DFREEGLUT_BUILD_DEMOS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "${srcdir}/freeglut-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m644 ../include/GL/glut.h "$pkgdir"/usr/${_arch}/include/GL
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

