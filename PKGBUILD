# Contributor: naelstrof <naelstrof@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Paul Bienkowski <opatutlol@aol.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
pkgname=mingw-w64-bullet
pkgver=2.87
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation (mingw-w64)"
arch=('any')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-cmake')
source=("https://github.com/bulletphysics/bullet3/archive/${pkgver}.tar.gz")
sha1sums=('31c6f6c4116f4d919eaa5119f9131bedc64d3951')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd ${srcdir}/bullet3-${pkgver}
  sed -i "s|FIND_PACKAGE(PythonLibs|#|g" CMakeLists.txt
  sed -i "s|Ws2tcpip.h|ws2tcpip.h|g" examples/ThirdPartyLibs/clsocket/src/SimpleSocket.h
  sed -i "s|Winsock2.h|winsock2.h|g" examples/ThirdPartyLibs/clsocket/src/StatTimer.h
  echo "target_link_libraries (BulletRobotics ws2_32 winmm)" >> Extras/BulletRobotics/CMakeLists.txt
}

build() {
  cd ${srcdir}/bullet3-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DBUILD_CPU_DEMOS=OFF \
      -DBUILD_BULLET2_DEMOS=OFF \
      -DBUILD_OPENGL3_DEMOS=OFF \
      -DBUILD_UNIT_TESTS=OFF \
      -DINSTALL_LIBS=1 \
      -DUSE_GLUT=0 \
      -DINSTALL_EXTRA_LIBS=1 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/bullet3-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
