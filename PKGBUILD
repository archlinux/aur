# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Simon Pintarelli <simon.pintarelli@gmail.com>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
pkgname=trilinos
pkgver=12.12.1
_pkgver=${pkgver//./-}
pkgrel=4
pkgdesc="algorithms for the solution of large-scale scientific problems"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('lapack' 'openmpi' 'python2' 'boost' 'netcdf' 'libmatio' 'libx11')
makedepends=('python2-numpy' 'swig' 'gcc-fortran' 'perl' 'blas' 'cmake' 
             'gtest' 'doxygen')
checkdepends=('cmake')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-$_pkgver.tar.gz")
sha256sums=('5474c5329c6309224a7e1726cf6f0d855025b2042959e4e2be2748bd6bb49e18')

prepare() {
    # https://github.com/trilinos/Trilinos/issues/862#issuecomment-365852261
    find Trilinos-trilinos-release-"$_pkgver" -name "*.py" -exec \
        sed -i '1s#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
}

build() {
    cd Trilinos-trilinos-release-"$_pkgver"
    mkdir -p build
    cd build

    cmake .. -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
             -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
             -DTrilinos_ENABLE_Gtest:BOOL=ON \
             -DTrilinos_ENABLE_TESTS=ON \
             -DTPL_ENABLE_gtest:BOOL=ON \
             -DTPL_ENABLE_MPI:BOOL=ON \
             -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
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
