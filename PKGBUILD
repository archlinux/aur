# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Millian Poquet <millian.poquet@gmail.com>

pkgname=simgrid
pkgver=4.0
pkgrel=1
pkgdesc="Scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems"
arch=(x86_64)
url="https://framagit.org/simgrid/simgrid"
license=(LGPL-2.1-only)
depends=(sh graphviz python gcc-libs boost-libs perl glibc)
makedepends=(cmake boost eigen doxygen pybind11 gcc-fortran nlohmann-json python-numpy)
source=("https://framagit.org/simgrid/simgrid/-/archive/v${pkgver}/simgrid-v${pkgver}.tar.gz")
sha256sums=('6a4958f7b3bfd347a1bddf0d739c0b394f63570a183921ff69ea3dfef04d7e04')

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  local _flags=(
    -Denable_compile_optimizations=ON
    -Denable_lto=ON
    -Denable_smpi=ON
    -Denable_documentation=ON
  )

  cmake -B build -S "simgrid-v${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

# Missing files for tests
#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
