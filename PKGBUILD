# Maintainer: Myles English <myles at rockhead.biz>
# Contributor: Feng Wang <wanng.fenng@gmail.com>
pkgname=trilinos
pkgver=12.0.1
pkgrel=1
pkgdesc="An effort to develop algorithms and enabling technologies within an object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems."
arch=('i686' 'x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('lapack' 'openmpi' 'python2' 'boost')
source=(https://trilinos.org/oldsite/download/files/${pkgname}-${pkgver}-Source.tar.bz2)
makedepends=('python2' 'python2-numpy' 'swig' 'gcc' 'gcc-fortran' 'openmpi' 'perl' 'blas' 'lapack' 'cmake')
# gcc-fortran gcc-fortran-multilib
md5sums=('19efcadf25c80b834f7c910ccfcca290')

build() {
  #export CFLAGS="$CFLAGS -g -O1"
  #export CXXFLAGS="$CXXFLAGS -g -O1"

  cd "$srcdir/$pkgname-$pkgver-Source"

  find ${srcdir}/${pkgname}-${pkgver}-Source -name "*" -type f -exec \
      sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

  sed -i 's#SWIG_VERSION_CEILING 2.0.8#SWIG_VERSION_CEILING 3.0.2#' \
	${srcdir}/${pkgname}-${pkgver}-Source/packages/PyTrilinos/CMakeLists.txt

  [[ -e build ]] && rm -rf build
  mkdir build 
  cd build

  cmake .. \
      -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=ON \
      -DTrilinos_ENABLE_FEI=OFF \
      -DTrilinos_ENABLE_STKClassic=OFF \
      -DTrilinos_ENABLE_Sundance=OFF \
      -DTrilinos_ENABLE_TESTS=OFF \
      -DTrilinos_ENABLE_OpenMP:BOOL=ON \
      -DTPL_ENABLE_MPI:BOOL=ON \
      -DTrilinos_ENABLE_PyTrilinos:BOOL=ON \
      -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DTPL_ENABLE_Netcdf=OFF          \
      -DTPL_ENABLE_QT=OFF              \
      -DTPL_ENABLE_GLM=OFF              \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      $EXTRA_ARGS

  make

}

package() {
    cd $srcdir/$pkgname-$pkgver-Source/build
    make install DESTDIR=$pkgdir

    mkdir -p "${pkgdir}/etc/profile.d"
    echo "export TRILINOS_DIR=/usr" > "${pkgdir}/etc/profile.d/trilinos.sh"
    chmod +x "${pkgdir}/etc/profile.d/trilinos.sh"

    # header confilcts with openmpi
#    rm "${pkgdir}/usr/include/mpi.h"
}
