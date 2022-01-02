# Maintainer: Thomas Pointhuber <thomas.pointhuber@gmx.at>
pkgname=sparselizard
pkgver=2021.11
pkgrel=1
pkgdesc="C++ FEM library | user-friendly | multi-physics | hp-adaptive | HPC"
arch=("i686" "x86_64")
url="https://www.sparselizard.org/"
license=('GPL2')
groups=()
depends=("cblas" "metis" "mumps" "openmpi" "petsc" "slepc" "gmsh")
makedepends=("cmake" "gcc")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/halbux/sparselizard/archive/refs/tags/v.$pkgver.tar.gz")
noextract=()
sha256sums=("d72882473d7bf23ac7aa833b5283ad8bb9ba498ace1b6c0eda2e6ee396248c5d")

build() {
  cd "sparselizard-v.$pkgver"

  mkdir -p build && cd build

  source /etc/profile.d/petsc.sh                # gets PETSC_DIR
  source /etc/profile.d/slepc.sh                # gets SLEPC_DIR

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DBLAS_INCLUDE_PATH=/usr/include \
        -DBLAS_LIBRARIES=/usr/lib/libcblas.so \
        -DMETIS_INCLUDE_PATH=/usr/include \
        -DMETIS_LIBRARIES=/usr/lib/libmetis.so \
        -DMUMPS_INCLUDE_PATH=/usr/include \
        -DMUMPS_LIBRARIES=/usr/lib/libmumps_common.so \
        -DMPI_INCLUDE_PATH=/usr/include \
        -DMPI_LIBRARIES=/usr/lib/openmpi/libmpi_cxx.so \
        -DMPI_PATH=/usr/lib/openmpi \
        -DPETSCCONF_INCLUDE_PATH="${PETSC_DIR}/include/" \
        -DPETSC_INCLUDE_PATH="${PETSC_DIR}/include/" \
        -DPETSC_LIBRARIES="${PETSC_DIR}/lib/libpetsc.so" \
        -DPETSC_PATH="${PETSC_DIR}/lib/" \
        -DSLEPC_INCLUDE_PATH="${SLEPC_DIR}/include/" \
        -DSLEPC_LIBRARIES="${SLEPC_DIR}/lib/libslepc.so" \
        -DGMSH_INCLUDE_PATH=/usr/include \
        -DGMSH_LIBRARIES=/usr/lib/libgmsh.so

  cmake --build . -j$(nproc)
}


package() {
  cd "sparselizard-v.$pkgver/build"

  make DESTDIR="${pkgdir}" install
}
