# Contributor: nic96

pkgname=terragear-git
_pkgname=terragear
epoch=1
pkgver=r1374.20240713.909a028
pkgrel=1
pkgdesc="TerraGear is a collection of open-source tools and rendering libraries which can transform publically available GIS data in 3D representations (i.e. 3D models or 3D maps) of the earth for use in real time rendering projects."
url="http://wiki.flightgear.org/TerraGear"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cgal' 'simgear' 'gdal>=2.0.0')
makedepends=('git' 'cmake' 'boost')
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


  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cd build

  make -C build
}

package() {
  cd "$srcdir/build"
  cd build
  make DESTDIR="$pkgdir" install
}
