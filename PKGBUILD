pkgname=mingw-w64-freeglut
pkgver=3.6.0
pkgrel=1
pkgdesc="Provides functionality for small OpenGL programs (mingw-w64)"
arch=(any)
url="http://freeglut.sourceforge.net/"
license=("MIT")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz")
sha256sums=('9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DFREEGLUT_BUILD_DEMOS=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -B build-${_arch} .
    make -C build-${_arch}
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

