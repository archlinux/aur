# Contributor: Martin Diehl <m.diehl@mpie.de>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Simon Pintarelli <simon.pintarelli@gmail.com>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
pkgname=trilinos
pkgver=12.18.1
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="algorithms for the solution of large-scale scientific problems"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('python' 'lapack' 'boost' 'netcdf' 'libmatio' 'libx11' 'hdf5-openmpi')
makedepends=('gcc-fortran' 'perl' 'blas' 'cmake' 'doxygen')
conflicts=('gtest')
checkdepends=('cmake')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-$_pkgver.tar.gz")
sha256sums=('7d2e1a1a3e2d2ce78bb248c63411fed5007c827b87cadee3d13c1a45c09a89cf')

build() {
    cd Trilinos-trilinos-release-"$_pkgver"
    mkdir -p build
    cd build

    cmake .. -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
             -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
             -DTrilinos_ENABLE_PyTrilinos:BOOL=OFF \
             -DTrilinos_ENABLE_Gtest:BOOL=ON \
             -DTrilinos_ENABLE_TESTS=OFF \
             -DTPL_ENABLE_gtest:BOOL=ON \
             -DTPL_ENABLE_MPI:BOOL=ON \
             -DTPL_ENABLE_HDF5:BOOL=ON \
             -DCMAKE_INSTALL_PREFIX:PATH=/usr \
             -DBUILD_SHARED_LIBS:BOOL=ON
    make VERBOSE=1
}

check() {
    cd Trilinos-trilinos-release-"$_pkgver"/build
    ctest
}

package() {
    cd Trilinos-trilinos-release-"$_pkgver"/build
    make DESTDIR="$pkgdir" install
}
