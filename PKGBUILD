# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dolfinx
pkgdesc="Next generation FEniCS problem solving environment"
pkgver=0.6.0
pkgrel=3
arch=(x86_64)
url="https://github.com/FEniCS/${pkgname}"
license=(LGPL3)
makedepends=(cmake)
depends=(boost python-fenics-ffcx hdf5-openmpi parmetis petsc pugixml)
checkdepends=(catch2)
optdepends=('adios2: for use ADIOS2 writer'
  'slepc: for use SLEPc eigen solver'
  'scotch: for compute graph partition'
  'kahip: for compute graph partition in parallel')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  requires-fix.patch::${url}/pull/2513.patch
  enum-fix.patch::${url}/pull/2646.patch)
sha512sums=('6e4bbeca9045cdc558fa5cdfd23abe55bdb773b326381eaa25f843e70d9df39c5707bfdf5412ae1845fc680bbbc7cb641f9cf6e4eb2226a760ddaab8d04237bf'
  '00c52da9c6af1babc57160930ff00e200cbfbe27baaa13874fa13dadbadfc03d42540873693cb451a5af6a9bc7bdab6d239b25ca5c8eecb21c40ea9cd47502c4'
  '5c5ea77d17604b740419066f9342314461c9b48216b4021d6ee822338721859c2e9c5a4406fb489d03416567735f4238cc8900d592b87a13956c08010a35b856')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/FEniCS/dolfinx/issues/2645
  patch -p1 -i ../requires-fix.patch
  patch -p1 -i ../enum-fix.patch
  # gcc-13-compatibilty
  sed -i '/#include <vector>/a #include <cstdint>' ${pkgname}-${pkgver}/cpp/dolfinx/graph/AdjacencyList.h
}

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DDOLFINX_ENABLE_ADIOS2=ON \
    -DDOLFINX_ENABLE_KAHIP=ON \
    -DDOLFINX_ENABLE_PARMETIS=ON \
    -DDOLFINX_ENABLE_SCOTCH=ON \
    -DDOLFINX_ENABLE_SLEPC=ON \
    -Wno-dev
  cmake --build build --target all
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  ffcx ${pkgname}-${pkgver}/cpp/test/poisson.py -o ${pkgname}-${pkgver}/cpp/test
  DESTDIR="${PWD}/tmp_install" cmake --build build --target install
  CMAKE_PREFIX_PATH="${srcdir}/tmp_install/usr/lib/cmake/${pkgname}" cmake \
    -S ${pkgname}-${pkgver}/cpp/test \
    -B build_test
  cmake --build build_test
  ctest --test-dir build_test
  CMAKE_PREFIX_PATH="${srcdir}/tmp_install/usr/lib/cmake/${pkgname}" cmake \
    -S ${pkgname}-${pkgver}/cpp/demo \
    -B build_demo
  cmake --build build_demo
  ctest -E "(demo_poisson_mpi_*|demo_hyperelasticity_mpi_*|demo_interpolation-io_mpi_*|demo_interpolation_different_meshes_mpi_*|demo_poisson_matrix_free_mpi_*)" --test-dir build_demo
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
