#!/hit/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#_fragment="#branch=2.0.5-beta-maintenance"

pkgname=appleseed-git
pkgver=2.1.0.beta.r275.g390d5cda9
pkgrel=1
epoch=1
pkgdesc="Physically-based global illumination rendering engine primarily designed for animation and visual effects (development vesion)."
arch=(i686 x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base seexpr-qt5 boost{,-python2}-libs openexr opencolorio openimageio openshadinglanguage xerces-c zlib)
makedepends=(boost{,-python2} cmake git ninja)
options=()
source=("${pkgname}::git+https://github.com/appleseedhq/appleseed.git${_fragment}"
        "boost_107400.patch"
        "cmake.extra.install.dirs.remove.patch"
        osl_1.11.8.patch::"https://github.com/appleseedhq/appleseed/pull/2900.patch"
        )
sha256sums=('SKIP'
            '8e7d453ced2a58b162b6e8e2ace09916755b70821837b2c7502a3417f03a25a3'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301'
            '0171eaa9ec499ecf74ac8878dbacfb28f81094e9a7bed46819314613e6ae7133')
b2sums=('SKIP'
        '8461888dc541113700f377379b0e688bdbc6a5b79bfda4c1b061c2e3811a03c43583272862d6b084f092c6bb372c15b31d2a25849b9e2d89d1e3ed657f680846'
        '85d278ea12672e44657fbfe8695744508db88cea54dbc93410632b05175c94a5e29e28dfb739ba88ec10a2449ff499484854ba177db03f5e41b24d2b8e6b9328'
        'cc21c08931d4e5060bbf9b8d2732e68eb28edc923e952db09665e2f63a0918e24f6d35f39a2ea2048a6b5ad67833df08bc9a5e1fea065e1df975ca5e40d414f0')

pkgver() {
  git -C "${srcdir}/${pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" apply -v ${srcdir}/{boost_107400,cmake.extra.install.dirs.remove,osl_1.11.8}.patch
  sed '/python37/s/37/39/' -i "${srcdir}/${pkgname}"/src/appleseed.python/CMakeLists.txt
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
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
              -DPYTHON3_INCLUDE_DIR="/usr/include/python${_pyver}"
              -Wno-dev
            )
  grep -q    avx /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX=ON)
  grep -q   avx2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX2=ON)
  grep -q   f16c /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_F16C=ON)
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_SSE42=ON)

  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}/${pkgname}" -B build -G Ninja
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
