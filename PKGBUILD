# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=appleseed-git
#_fragment=
pkgver=1.7.0.beta.r719.g7ebe81fc2
pkgrel=1
pkgdesc="physically-based global illumination rendering engine primarily designed for animation and visual effects. "
arch=(i686 x86_64)
url="http://appleseedhq.net"
license=('MIT')
depends=(python2 qt4 'seexpr>=2.11' boost openexr opencolorio openimageio openshadinglanguage xerces-c zlib)
makedepends=(git cmake)
options=()
source=("${pkgname}::git+https://github.com/appleseedhq/appleseed.git${_fragment}"
        "cmake.extra.install.dirs.remove.patch")
md5sums=('SKIP'
         'd4ca0164563a11be1608c3e5f957c684')

CMAKE_FLAGS="-DUSE_EXTERNAL_EXR=ON \
              -DUSE_EXTERNAL_OCIO=ON \
              -DUSE_EXTERNAL_OIIO=ON \
              -DUSE_EXTERNAL_OSL=ON \
              -DUSE_EXTERNAL_PNG=ON \
              -DUSE_EXTERNAL_XERCES=ON \
              -DUSE_EXTERNAL_ZLIB=ON \
              -DUSE_EXTERNAL_SEEXPR=ON \
              -DUSE_STATIC_BOOST=OFF \
              -DUSE_STATIC_OCIO=OFF \
              -DUSE_STATIC_OIIO=OFF \
              -DUSE_STATIC_OSL=OFF \
              -DWITH_DISNEY_MATERIAL=ON \
              -DWARNINGS_AS_ERRORS=OFF"

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  patch -Np1 -i ../cmake.extra.install.dirs.remove.patch
  grep -q avx /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX=ON"
  grep -q avx2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX2=ON"
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_SSE42=ON"
}
build() {
  cd ${pkgname}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Ship -DCMAKE_INSTALL_PREFIX=/opt/appleseed ${CMAKE_FLAGS} ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="$pkgdir/" install
  install -D -m644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"h
}

# vim:set ts=2 sw=2 et:
