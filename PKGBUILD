# Maintainer: David Wells <dr wells at vt dot e d u>
# Contributor: Florian Dang <florian dot coin at gmail dot com>

pkgname=deal-ii
_realname=dealii
pkgver=8.5.0
pkgrel=1
pkgdesc="An Open Source Finite Element Differential Equations Analysis Library"
arch=("i686" "x86_64")
url="http://www.dealii.org/"
license=('LGPL')
depends=('boost')
optdepends=(
      'arpack: Fortran77 subroutines designed to solve large scale eigenvalue problems'
      'atlas-lapack: Complete LAPACK and BLAS implementation using optimized ATLAS routines'
      'bzip2: A high-quality data compression program'
      'doxygen: A documentation system for C++, C, Java, IDL, and PHP'
      'p4est-deal-ii: The parallel forest (p4est) library, built to work with deal.II'
      'gsl: A modern numerical library for C and C++ programmers'
      'hdf5-openmpi: General purpose library and file format for storing scientific data'
      'intel-tbb: High level abstract threading library'
      'lapack: Linear Algebra PACKage'
      'mathjax: An open source Javascript display engine for mathematics that works in all modern browsers.'
      'metis: partitioning graphs, finite element meshes, fill reducing orderings for sparse matrices.'
      'muparser: A fast math parser library'
      'netcdf-cxx-legacy: Legacy NetCDF C++ bindings'
      'openmpi: High performance message passing library (MPI)'
      'opencascade: Open CASCADE Technology, 3D modeling & numerical simulation'
      'petsc: Portable, extensible toolkit for scientific computation'
      'slepc: Scalable library for Eigenvalue problem computations'
      'trilinos: object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems'
      'suitesparse: A collection of sparse matrix libraries'
      'zlib: Compression library implementing the deflate compression method found in gzip and PKZIP'
      )
makedepends=('cmake')
install=deal-ii.install
source=(https://github.com/dealii/dealii/releases/download/v$pkgver/${_realname}-$pkgver.tar.gz)
sha1sums=('75076beddfd4a1b590cba9fbc78eea901c7f3ddb')

build() {
  # where to install deal.II: change to something else (e.g., /opt/deal.II/)
  # if desired.
  installation_prefix=/usr

  # Since deal.II relies on a relatively large number of packages that are
  # installed in nonstandard places (i.e., the Trilinos AUR package is installed
  # in /opt/trilinos/), source their environment variable scripts in the
  # (likely) case that a user installed one of these packages without logging
  # out and logging back in
  for package in opencascade p4est-deal-ii petsc slepc trilinos
  do
      if pacman -Qs $package >/dev/null
      then
          source /etc/profile.d/$package.sh
      fi
  done

  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ ../${_realname}-$pkgver

  make

  cd "${srcdir}/build"
  echo "export DEAL_II_DIR=$installation_prefix" > ./deal-ii.sh
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/build/deal-ii.sh" "${pkgdir}/etc/profile.d/deal-ii.sh"
  install -D -m644 "${srcdir}/${_realname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/LICENSE"
}
