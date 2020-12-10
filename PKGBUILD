#!/bin/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#_fragment="#branch=2.0.5-beta-maintenance"

pkgname=appleseed-git
pkgver=2.1.0.beta.r267.gabb612f03
pkgrel=1
epoch=1
pkgdesc="physically-based global illumination rendering engine primarily designed for animation and visual effects. "
arch=(i686 x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base seexpr-qt5 boost openexr opencolorio 'openimageio=2.1.19.0' 'openshadinglanguage=1.10.13' xerces-c zlib)
makedepends=(cmake git ninja)
options=()
source=("${pkgname}::git+https://github.com/appleseedhq/appleseed.git${_fragment}"
        "cmake.extra.install.dirs.remove.patch"
        )
sha256sums=('SKIP'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301')
b2sums=('SKIP'
        '85d278ea12672e44657fbfe8695744508db88cea54dbc93410632b05175c94a5e29e28dfb739ba88ec10a2449ff499484854ba177db03f5e41b24d2b8e6b9328')

pkgver() {
  git -C "${srcdir}/${pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" apply -v ${srcdir}/{cmake.extra.install.dirs.remove}.patch
  sed '/python37/s/37/39/' -i "${srcdir}/${pkgname}"/src/appleseed.python/CMakeLists.txt
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
CMAKE_FLAGS=( -DWITH_EMBREE=ON
              -DCMAKE_BUILD_TYPE=Ship
              -DCMAKE_INSTALL_PREFIX="/opt/appleseed"
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
              -DPYTHON3_INCLUDE_DIR="/usr/include/python${_pyver}"
            )
  grep -q    avx /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX=ON)
  grep -q   avx2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX2=ON)
  grep -q   f16c /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_F16C=ON)
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_SSE42=ON)

  cmake ${CMAKE_FLAGS[*]} -S "${srcdir}/${pkgname}" -B build -G Ninja
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
