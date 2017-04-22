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
      'p4est-deal-ii: The parallel forest (p4est) library, built to work with deal.II'
      'gsl: A modern numerical library for C and C++ programmers'
      'hdf5-openmpi: General purpose library and file format for storing scientific data'
      'intel-tbb: High level abstract threading library'
      'lapack: Linear Algebra PACKage'
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

# where to install deal.II: change to something else (e.g., /opt/deal.II/)
# if desired.
installation_prefix=/usr

build() {

  # Since deal.II relies on a relatively large number of packages that are
  # installed in nonstandard places (i.e., the Trilinos AUR package is installed
  # in /opt/trilinos/), source their environment variable scripts in the
  # (likely) case that a user installed one of these packages without logging
  # out and logging back in
  for package in opencascade p4est-deal-ii petsc slepc trilinos
  do
      if pacman -Qs $package >/dev/null
         profile_file=/etc/profile.d/$package.sh
         if [ -f $profile_file ]
         then
             source /etc/profile.d/$package.sh
         fi
      fi
  done

  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # explicitly disallow bundled packages: this disables bundled copies of boost,
  # intel-tbb, part of suitesparse, and muparser, which are all available in the
  # standard repositories
  cmake_configuration_flags=" -DDEAL_II_ALLOW_BUNDLED=OFF"

  # deal.II does not use more aggressive search paths (which we need) for MPI
  # unless we explicitly enable it, so check for MPI and then turn it on:
  if pacman -Qs openmpi >/dev/null
  then
      cmake_configuration_flags+=" -DDEAL_II_WITH_MPI=ON"
  fi

  # See if PETSc was configured to use 64 bit indices:
  if pacman -Qs petsc >/dev/null
  then
      if grep '^#define PETSC_USE_64BIT_INDICES 1' $PETSC_DIR/include/petscconf.h >/dev/null
      then
         cmake_configuration_flags+=" -DDEAL_II_WITH_64BIT_INDICES=ON"
      fi
  fi

  # deal.II does not compile with OpenMP: if we use Trilinos and some Epetra
  # headers have OpenMP pragmas enabled then skip unknown pragma warnings.
  extra_warning_flags=""
  if pacman -Qs trilinos >/dev/null
  then
      if [ -f $TRILINOS_DIR/include/Epetra_config.h ]
      then
          if grep '^#define EPETRA_HAVE_OMP$' $TRILINOS_DIR/include/Epetra_config.h >/dev/null
          then
             extra_warning_flags+=" -Wno-unknown-pragmas"
          fi
      fi
  fi

  # the deal.II GCC flags are already well-chosen for speed (and -O3 is known to
  # be slightly slower than O2), so do not use flags in /etc/makepkg.conf by
  # default. If you want to edit this file to use other flags then pass cmake
  # -DCMAKE_CXX_FLAGS=" flags-you-want".
  #
  # if you wish to disable specific optional packages, then pass (e.g., for
  # Trilinos)
  #
  #     -DDEAL_II_WITH_TRILINOS=OFF
  #
  # to cmake.
  cmake $cmake_configuration_flags -DCMAKE_INSTALL_PREFIX=$installation_prefix  \
        -DCMAKE_INSTALL_MESSAGE=NEVER -DCMAKE_CXX_FLAGS=" $extra_warning_flags" \
        -DDEAL_II_SHARE_RELDIR=share/${pkgname}/                                \
        -DDEAL_II_EXAMPLES_RELDIR=share/${pkgname}/examples/                    \
        -DDEAL_II_COMPONENT_DOCUMENTATION=OFF ../${_realname}-$pkgver

  # if you do not have /etc/makepkg.conf configured, then add -jN (where N is
  # the number of concurrent build jobs, usually 2 * number of physical cores)
  # to this flag. deal.II needs about 2 GB/compilation process so use fewer jobs
  # if your machine does not have the memory to support the maximum number.
  # make $MAKEFLAGS
  make -j10

  cd "${srcdir}/build"
  echo "export DEAL_II_DIR=$installation_prefix" > ./deal-ii.sh
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # delete extra files that deal.II installs into the top level directory
  rm "${pkgdir}/${installation_prefix}/LICENSE"
  rm "${pkgdir}/${installation_prefix}/README.md"

  install -D -m755 "${srcdir}/build/deal-ii.sh" "${pkgdir}/etc/profile.d/deal-ii.sh"
  install -D -m644 "${srcdir}/${_realname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/LICENSE"
}
