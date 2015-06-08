# Contributor: naelstrof <naelstrof@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Paul Bienkowski <opatutlol@aol.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
pkgname=mingw-w64-bullet
pkgver=2.83.4
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation (mingw-w64)"
arch=('any')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-cmake')
source=("https://github.com/bulletphysics/bullet3/archive/${pkgver}.tar.gz")
md5sums=('58b4e151bf580fe6746e8413cb2a4cbe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd ${srcdir}/bullet3-${pkgver}
  #sed -i "s|#define SIMD_EPSILON      FLT_EPSILON|#define SIMD_EPSILON 1.19209290E-07F|g" src/LinearMath/btScalar.h
}

build() {
  cd ${srcdir}/bullet3-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=1 \
      -DBUILD_EXTRAS=1 \
      -DBUILD_CPU_DEMOS=OFF \
      -DBUILD_BULLET2_DEMOS=OFF \
      -DBUILD_OPENGL3_DEMOS=OFF \
      -DBUILD_UNIT_TESTS=OFF \
      -DINSTALL_LIBS=1 \
      -DUSE_GLUT=0 \
      -DINSTALL_EXTRA_LIBS=1 \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS_RELEASE="-fpermissive" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/bullet3-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -Dm644 "${srcdir}"/bullet3-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
