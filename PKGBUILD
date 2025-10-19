# Maintainer:  dreieck
# Contributor: nic96

pkgname=terragear-git
_pkgname=terragear
epoch=1
pkgver=r1393.20250919.9a169113
pkgrel=1
pkgdesc="TerraGear is a collection of open-source tools and rendering libraries which can transform publically available GIS data in 3D representations (i.e. 3D models or 3D maps) of the earth for use in real time rendering projects."
url="http://wiki.flightgear.org/TerraGear"
license=('GPL')
arch=('i686' 'x86_64')
depends=(
  'cgal'
  'gdal>=2.0.0'
  'simgear'
)
makedepends=(
  'git'
  'cmake'
  'boost174'
  'gmp'
  'mpfr'
  'openscenegraph'
)
source=("git+https://gitlab.com/flightgear/terragear")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_pkgname}"
  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  # sed -i "s/add_subdirectory(cgal_tests)/#add_subdirectory(cgal_tests)/g" "${_pkgname}/src/BuildTiles/CMakeLists.txt"

  ## 2025-08-24: Build fails on `include ( ${CGAL_USE_FILE} )` in `CMakeLists.txt` with `include called with wrong number of arguments. include() only takes one file.`. See https://gitlab.com/flightgear/terragear/-/issues/2.


  # -DBoost_DIR="/opt/boost-1.74.0/lib/cmake/Boost-1.74.0" because currently simgear as configured that way, so we need that here, too.
  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBoost_DIR="/opt/boost-1.74.0/lib/cmake/Boost-1.74.0" \
    -DCGAL_WITH_GMPXX=ON \
    -DCGAL_DEV_MODE=OFF \
    -DCGAL_ENABLE_TESTING=OFF \
    -DCGAL_TEST_DRAW_FUNCTIONS=OFF \
    -DCGAL_CTEST_DISPLAY_MEM_AND_TIME=ON


  make -C build
}

package() {
  cd "$srcdir/build"
  cd build
  make DESTDIR="$pkgdir" install
}
