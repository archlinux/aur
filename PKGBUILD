pkgname=mingw-w64-freeglut
pkgver=3.0.0
pkgrel=1
pkgdesc="Provides functionality for small OpenGL programs (mingw-w64)"
arch=(any)
url="http://freeglut.sourceforge.net/"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz")
md5sums=('90c3ca4dd9d51cf32276bc5344ec9754')
sha1sums=('fca52242f9344627a30f11487ee42002e6b0dacd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
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
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

