# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Gianluca Pettinello <g_pet@hotmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Simon Pintarelli <simon.pintarelli@gmail.com>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
pkgname=trilinos
pkgver=15.0.0
_pkgver=${pkgver//./-}
pkgrel=2
pkgdesc="algorithms for the solution of large-scale scientific problems"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('python' 'lapack' 'boost' 'netcdf' 'libmatio' 'libx11' 'hdf5-openmpi')
makedepends=('gcc-fortran' 'perl' 'blas' 'cmake' 'bc' 'python-numpy')
provides=('trilinos-sacado' 'zoltan')
checkdepends=('cmake')
source=("https://github.com/trilinos/Trilinos/archive/refs/tags/trilinos-release-$_pkgver.tar.gz"
        'compiler-errors.patch')
sha256sums=('5651f1f967217a807f2c418a73b7e649532824dbf2742fa517951d6cc11518fb'
            'a75cf248121cb7284982075523f3e4eadcc799c9cc40ee9527330905e29bb3c3')

prepare() {
  patch -d  Trilinos-trilinos-release-"$_pkgver" -p1 -i ../compiler-errors.patch
}

build() {
  cmake -S Trilinos-trilinos-release-"$_pkgver" \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D BUILD_SHARED_LIBS:BOOL=ON \
        -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
        -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
        -D Trilinos_ENABLE_PyTrilinos:BOOL=OFF \
        -D Trilinos_ENABLE_Gtest:BOOL=OFF \
        -D Trilinos_ENABLE_TESTS:BOOL=OFF \
        -D Trilinos_ENABLE_TrilinosFrameworkTests:BOOL=OFF \
        -D Trilinos_ENABLE_TrilinosATDMConfigTests:BOOL=OFF \
        -D TPL_ENABLE_gtest:BOOL=OFF \
        -D TPL_ENABLE_MPI:BOOL=ON \
        -D TPL_ENABLE_HDF5:BOOL=ON \
        -D CMAKE_Fortran_FLAGS="$FCFLAGS -fallow-argument-mismatch"
  make -C build
}

check() {
  cd build
  ctest
}

package() {
  DESTDIR=${pkgdir} cmake --install build
}
