# Maintainer: Alessandro G. Magnasco <alessandromagnasco at gmail dot com>
# Contributor: Bertrand Lacoste <bertrandlacoste at gmail dot com>
# Contributor: Tim Langlois <langlois at cs dot cornell dot edu>

pkgname=hypre
pkgver=2.11.0
_suffix='babel'
## Use the source from petsc website, suffixed by _p1. Also change the source and checksums.
#_suffix='p1'
pkgrel=1
pkgdesc="A library for solving large, sparse linear systems on massively parallel computers"
arch=('i686' 'x86_64')
url="http://acts.nersc.gov/hypre"
license=('lgpl')
depends=('gcc-libs' 'gcc-fortran' 'openmpi' 'blas' 'lapack' 'superlu')
#OLD SOURCE source=(http://computation.llnl.gov/project/linear_solvers/download/${pkgname}-${pkgver}-${_suffix}.tar.gz)
source=(http://computation.llnl.gov/project/linear_solvers/download/v${pkgver}.tar.gz)
md5sums=('aeba702e1b6c6e9f7b7627e56c51ca69')

# MIRROR -- OLD (NOT UP YET)
# source=(http://ftp.mcs.anl.gov/pub/petsc/externalpackages/hypre-2.10.0b-p1.tar.gz)
# md5sums=('7aa49089176c8bef7f51a0234264f952')

build() {
  _build_dir="${srcdir}/${pkgname}-${pkgver}-${_suffix}"
  cd "${_build_dir}/src"
  

  CFLAGS='-O3 -fopenmp -DMPIPP_H'
  CXXFLAGS='-O3 -fopenmp -DMPIPP_H'
  MPI_FLAGS=(--with-MPI --with-openmp --with-MPI-lib-dirs=/usr/lib/openmpi)
  MPI_FLAGS+=(--with-MPI-libs="gomp mpi mpi_usempif08 mpi_usempi_ignore_tkr mpi_mpifh gfortran m quadmath pthread")
    
  # disable internal superlu and fei for now, not sure yet how to get it to use external superlu
  ./configure --prefix=/usr --enable-shared \
      --with-superlu --with-extra-incpath=/usr/include/superlu \
      --without-fei --without-babel \
      --with-blas=yes --with-lapack=yes \
      "${MPI_FLAGS[@]}" \
      CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
  make
}

check() {
  _build_dir="${srcdir}/${pkgname}-${pkgver}-${_suffix}"
  cd "${_build_dir}/src"

  make test
}

package() {
  _build_dir="${srcdir}/${pkgname}-${pkgver}-${_suffix}"
  cd "${_build_dir}/src"

  mkdir -p ${pkgdir}/usr/lib ${pkgdir}/usr/include

  install -m644 ${_build_dir}/src/hypre/include/*.h ${pkgdir}/usr/include
  install -m644 ${_build_dir}/src/hypre/lib/libHYPRE-${pkgver}.so ${pkgdir}/usr/lib
  ln -s libHYPRE-${pkgver}.so ${pkgdir}/usr/lib/libHYPRE.so
}

