gitname=GPlates
pkgname=${gitname,,}-git
pkgver=2.6.0.56.291.ga46c71a01
pkgrel=1
pkgdesc='plate tectonic reconstructions'
arch=(x86_64)
url=https://github.com/$gitname/$gitname
license=(CC-BY-3.0 CC-BY-4.0 GPL-2.0-only)
depends=(
  boost-libs
  gdal
  glew
  glibc
  glu
  gmp
  libgcc
  libglvnd
  libstdc++
  mpfr
  proj
  python
  python-numpy
  qt6-base
  qt6-svg
  qwt
  zlib
)
makedepends=(
  boost
  cgal
  cmake
  git
  ninja
)
provides=(gplates)
conflicts=(gplates)
source=("git+$url.git#branch=main"
  'gplates_2.5.0_geodata.zip::https://zenodo.org/records/14194897/files/gplates_2.5.0_geodata.zip?download=1')
sha256sums=(SKIP
  387a912cf560657c7e4b63d9a8d66055e81f215903a64f755ea207d500c8051b)
pkgver() {
  cd GPlates
  git describe --tags --long --match 'GPlates-[0-9]*' | sed 's/^GPlates-//;s/-/./g'
}
build() {
  cmake -S GPlates -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGPLATES_INSTALL_GEO_DATA=ON \
    -DGPLATES_INSTALL_GEO_DATA_SOURCE_DIR="$srcdir/GeoData"
  cmake --build build
}
package() {
  local data=/usr/share/gplates/GeoData/GPlatesQuickStart-RigidModel/DataBundleForNovice-Muller_etal_2022.gproj
  DESTDIR="$pkgdir" cmake --install build
  mv -i "$pkgdir"/usr/bin/gplates{,-bin}
  install -m 755 <(printf '%s\n%s\n' '#!/usr/bin/bash' "exec /usr/bin/gplates-bin -p $data") "$pkgdir"/usr/bin/gplates
}
