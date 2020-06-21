# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=appleseed
pkgrel=1
pkgver=2.1.0
_pkgver=${pkgver}-beta
pkgdesc="Physically-based global illumination rendering engine primarily designed for animation and visual effects."
arch=(x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base seexpr-qt5 boost openexr opencolorio openimageio 'openshadinglanguage>=1.8.9' xerces-c zlib)
makedepends=(cmake)
options=()
source=("https://github.com/${pkgname}hq/${pkgname}/archive/${_pkgver}.tar.gz"
        "cmake.extra.install.dirs.remove.patch"
        )
sha256sums=('5f8599c64a9c1dbdf0d8ee13a4d395b03e9bcba17fec731526109437ab760898'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301')


CMAKE_FLAGS=( -DWITH_EMBREE=ON
              -DWITH_DISNEY_MATERIAL=ON
              -DWITH_PYTHON3_BINDINGS=ON
              -DUSE_STATIC_EMBREE=OFF
              -DUSE_STATIC_EXR=OFF
              -DUSE_STATIC_BOOST=OFF
              -DUSE_STATIC_OCIO=OFF
              -DUSE_STATIC_OIIO=OFF
              -DUSE_STATIC_OSL=OFF
              -DWARNINGS_AS_ERRORS=OFF
            )

prepare() {
  cd ${pkgname}-${_pkgver}
  patch -Np1 -i ${srcdir}/cmake.extra.install.dirs.remove.patch
  grep -q avx /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX=ON"
  grep -q avx2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX2=ON"
  grep -q f16c /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_F16C=ON"
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_SSE42=ON"
}

build() {
  cd ${pkgname}-${_pkgver}
  mkdir -p build
  cd build
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  CMAKE_FLAGS+=( -DPYTHON3_INCLUDE_DIR=/usr/include/python${_pyver}m )
  cmake -DCMAKE_BUILD_TYPE=Ship -DCMAKE_INSTALL_PREFIX=/opt/appleseed ${CMAKE_FLAGS[*]} ..
  make
}

package() {
  cd ${pkgname}-${_pkgver}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
