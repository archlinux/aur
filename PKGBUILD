# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Myles English <myles at rockhead.biz>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgname=Trilinos
pkgname=${_pkgname,,}-git
pkgver=12.12.21207.g90d80e9f993
pkgrel=1
pkgdesc="Algorithms for the solution of large-scale, complex multi-physics engineering and scientific problems"
arch=(x86_64)
url="https://github.com/${_pkgname,,}/${_pkgname}"
license=(LGPL3)
source=(${_pkgname}::git+${url}.git)
depends=(python lapack boost netcdf-openmpi libmatio libx11 hdf5-openmpi)
makedepends=(gcc-fortran perl blas cmake git python-numpy swig doxygen graphviz) # gcc-fortran-multilib
md5sums=('SKIP')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")

pkgver() {
  cd ${_pkgname}
  # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long | sed -e 's/root-of-trilinos-release-//' -e 's/branch-//' -e 's/^v//;s/-/./g'
}

build() {
  cmake \
    -S ${_pkgname} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_TESTING:BOOL=ON \
    -DCMAKE_CXX_STANDARD:STRING=14 \
    -DTPL_ENABLE_MPI:BOOL=ON \
    -DCMAKE_C_COMPILER:STRING=/usr/bin/mpicc \
    -DCMAKE_CXX_COMPILER:STRING=/usr/bin/mpic++ \
    -DCMAKE_Fortran_COMPILER:STRING=/usr/bin/mpifort \
    -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
    -DTrilinos_ENABLE_FEI:BOOL=ON \
    -DTrilinos_ENABLE_SEACAS:BOOL=OFF \
    -DTrilinos_ENABLE_TESTS:BOOL=ON \
    -DTrilinos_ENABLE_OpenMP:BOOL=ON \
    -DTPL_ENABLE_MPI:BOOL=ON \
    -DTrilinos_ENABLE_Zoltan=OFF \
    -DTrilinos_ENABLE_PyTrilinos:BOOL=OFF \
    -DTrilinos_ENABLE_Gtest:BOOL=ON \
    -DTPL_ENABLE_Netcdf:BOOL=ON \
    -DTPL_ENABLE_HDF5:BOOL=ON \
    -DTPL_ENABLE_QT:BOOL=OFF \
    -DTPL_ENABLE_GLM:BOOL=OFF \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
