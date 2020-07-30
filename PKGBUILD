pkgname=mingw-w64-freeglut
pkgver=3.2.1
pkgrel=3
pkgdesc="Provides functionality for small OpenGL programs (mingw-w64)"
arch=(any)
url="http://freeglut.sourceforge.net/"
license=("MIT")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("https://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz"
        'gcc10.patch')
sha256sums=('d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68'
            '2d140f9a76f16267699aeb8681da59e43345aaa1e2ff6e82032d711f72f6b66a')
noextract=("freeglut-${pkgver}.tar.gz")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Clean up old sources so re-patching doesn't fail.
  [[ -d ${srcdir}/freeglut-${pkgver} ]] && rm -rf ${srcdir}/freeglut-${pkgver}
  tar -xzvf ${srcdir}/freeglut-${pkgver}.tar.gz -C ${srcdir}
  cd "${srcdir}/freeglut-${pkgver}"
  patch -Np1 -i "${srcdir}/gcc10.patch"
}

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DFREEGLUT_BUILD_DEMOS=OFF \
      ..
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

