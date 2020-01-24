# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=appleseed-git
#_fragment="#branch=2.0.5-beta-maintenance"
pkgver=2.1.0.beta.r137.g802dbf67b
pkgrel=1
epoch=1
pkgdesc="physically-based global illumination rendering engine primarily designed for animation and visual effects. "
arch=(i686 x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base seexpr-qt5 boost openexr opencolorio openimageio 'openshadinglanguage>=1.8.9' xerces-c zlib)
makedepends=(git cmake)
options=()
source=("${pkgname}::git+https://github.com/appleseedhq/appleseed.git${_fragment}"
        "cmake.extra.install.dirs.remove.patch"
        )
sha256sums=('SKIP'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301')


CMAKE_FLAGS=( -DWITH_EMBREE=ON
              -DCMAKE_BUILD_TYPE=Ship
              -DCMAKE_INSTALL_PREFIX=/opt/appleseed
              -DWITH_DISNEY_MATERIAL=ON
              -DWITH_PYTHON3_BINDINGS=ON
              -DUSE_STATIC_EMBREE=OFF
              -DUSE_STATIC_EXR=OFF
              -DUSE_STATIC_BOOST=OFF
              -DUSE_STATIC_OCIO=OFF
              -DUSE_STATIC_OIIO=OFF
              -DUSE_STATIC_OSL=OFF
              -DWARNINGS_AS_ERRORS=OFF
              -DWITH_BENCH=OFF
            )

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git apply -v ${srcdir}/cmake.extra.install.dirs.remove.patch
# git apply -v ${srcdir}/*.diff
  sed '/python37/s/37/38/' -i src/appleseed.python/CMakeLists.txt
  grep -q avx /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX=ON"
  grep -q avx2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX2=ON"
  grep -q f16c /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_F16C=ON"
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_SSE42=ON"
}

build() {
_pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
CMAKE_FLAGS+=(-DPYTHON3_INCLUDE_DIR=/usr/include/python${_pyver})
  cd ${pkgname}
  mkdir -p build
  cd build
  cmake ${CMAKE_FLAGS[*]} ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
