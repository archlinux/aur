# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dolfinx
pkgdesc="Next generation FEniCS problem solving environment"
pkgver=0.7.2
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${pkgname}"
license=(LGPL3)
makedepends=(cmake)
depends=(boost hdf5-openmpi petsc pugixml python-fenics-ffcx scotch)
checkdepends=(catch2)
optdepends=('adios2: for use ADIOS2 writer'
  'kahip: for compute graph partition in parallel'
  'parmetis: for parallel graph partitioning'
  'slepc: for use SLEPc eigen solver')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('268791b1891992f917d5d625825fa926feaf8663dc0571158891bbf11afbd8bdad3247c53aa2c79e9012be0e9a14acc0cf80beebe77a80a71b94315be97b9ffa')

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
    -DDOLFINX_SKIP_BUILD_TESTS=OFF \
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
  ctest -E "(demo_poisson_mpi_*|demo_hyperelasticity_mpi_*|demo_biharmonic_mpi_*|demo_poisson_matrix_free_mpi_*|demo_interpolation-io_mpi_*|emo_interpolation_different_meshes_mpi_*|demo_mixed_topology_mpi_*)" --test-dir build_demo
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
