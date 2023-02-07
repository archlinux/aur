# Maintainer: David Wells <dr wells at vt dot e d u>
# Contributor: Florian Dang <florian dot coin at gmail dot com>

pkgname=deal-ii
_realname=dealii
pkgver=9.4.2
pkgrel=1
pkgdesc="An Open Source Finite Element Differential Equations Analysis Library"
arch=("i686" "x86_64")
url="http://www.dealii.org/"
license=('LGPL')
depends=('boost')
optdepends=(
      # adol-c is not compatible with Trilinos - if both are installed then deal.II will use Trilinos
      'adol-c: automatic differentiation library'
      'arpack: Fortran77 subroutines designed to solve large scale eigenvalue problems'
      'assimp: Library to import various well-known 3D model formats in an uniform manner'
      'cgal: Computational Geometry Algorithms Library'
      # ginkgo is not yet in the AUR
      # 'ginkgo: a high-performance linear algebra library for manycore systems'
      'gmsh: An automatic 3D finite element mesh generator with pre and post-processing facilities'
      'gsl: A modern numerical library for C and C++ programmers'
      'hdf5-openmpi: General purpose library and file format for storing scientific data'
      'intel-mkl: Intel Math Kernel Library'
      'lapack: Linear Algebra PACKage'
      'metis: partitioning graphs, finite element meshes, fill reducing orderings for sparse matrices.'
      'muparser: A fast math parser library'
      'openmpi: High performance message passing library (MPI)'
      'opencascade: Open CASCADE Technology, 3D modeling & numerical simulation'
      'p4est-deal-ii: The parallel forest (p4est) library, built to work with deal.II'
      'parmetis: A parallel graph partitioning library'
      'petsc: Portable, extensible toolkit for scientific computation'
      'scalapack: subset of scalable LAPACK routines redesigned for distributed memory MIMD parallel computers'
      'slepc: Scalable library for Eigenvalue problem computations'
      'sundials: Suite of nonlinear differential/algebraic equation solvers'
      'symengine: Fast symbolic manipulation library'
      'tbb: High level abstract threading library'
      'trilinos: object-oriented software framework for the solution of large-scale, complex multi-physics engineering and scientific problems'
      'suitesparse: A collection of sparse matrix libraries'
      'zlib: Compression library implementing the deflate compression method found in gzip and PKZIP'
      )
makedepends=('cmake')
install=deal-ii.install
source=(https://github.com/dealii/dealii/releases/download/v$pkgver/${_realname}-$pkgver.tar.gz)
sha1sums=('ea4b5fadb45a34f4f9399d305548671a8059760b')
# where to install deal.II: change to something else (e.g., /opt/deal.II/)
# if desired.
_installation_prefix=/usr

build() {
  # Since deal.II relies on a relatively large number of packages that are
  # installed in nonstandard places (e.g., the PETSc AUR package is installed in
  # /opt/petsc/), source their environment variable scripts in the (likely) case
  # that a user installed one of these packages without logging out and logging
  # back in
  for package in opencascade p4est-deal-ii petsc slepc intel-mkl
  do
      if pacman -Qs $package >/dev/null
      then
          profile_file=/etc/profile.d/$package.sh
          if [ -f $profile_file ]
          then
              source /etc/profile.d/$package.sh
          fi
      fi
  done

  # deal.II needs TRILINOS_DIR to be set in order to find Trilinos, so export
  # the default value:
  if pacman -Qs trilinos >/dev/null
  then
     export TRILINOS_DIR=/usr
  fi

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
  if [ -n "${PETSC_DIR+x}" ]
  then
      if grep '^#define PETSC_USE_64BIT_INDICES 1' $PETSC_DIR/include/petscconf.h >/dev/null
      then
         cmake_configuration_flags+=" -DDEAL_II_WITH_64BIT_INDICES=ON"
      fi
  fi

  # deal.II cannot find MKL unless we specify where its header is
  if [ -n "${MKLROOT+x}" ]
  then
     cmake_configuration_flags+=" -DLAPACK_INCLUDE_DIRS=${MKLROOT}/include"
  fi

  # For GSL compatibility we need the full link interface, which includes
  # libgslcblas, so disable --as-needed with GCC:
  sed -i '/ENABLE_IF_LINKS(DEAL_II_LINKER_FLAGS "-Wl,--as-needed")/d' \
      ${srcdir}/${_realname}-$pkgver/cmake/setup_compiler_flags_gnu.cmake

  sed -i '122ifedisableexcept(FE_INVALID);\n' \
      ${srcdir}/${_realname}-$pkgver/tests/quick_tests/scalapack.cc

  # Also remove from LDFLAGS if necessary
  LDFLAGS=$(echo $LDFLAGS | sed 's/--as-needed,//')

  # Skip some warnings that appear if Trilinos uses OpenMP pragmas in headers:
  extra_warning_flags=" -Wno-unknown-pragmas"
  # Also skip warnings from compiling without optimizations (debug mode) and
  # _FORTIFY_SOURCE:
  extra_warning_flags="${extra_warning_flags} -Wno-cpp"

  # the deal.II GCC flags are already well-chosen for speed (and O3 is known to
  # be slightly slower than O2), so do not use flags in /etc/makepkg.conf by
  # default. If you want to add more flags or disable specific packages, then
  # refer to the deal.II manual.
  cmake $cmake_configuration_flags -DCMAKE_INSTALL_PREFIX=$_installation_prefix \
        -DCMAKE_INSTALL_MESSAGE=NEVER -DCMAKE_CXX_FLAGS=" $extra_warning_flags" \
        -DDEAL_II_SHARE_RELDIR=share/${pkgname}/                                \
        -DDEAL_II_EXAMPLES_RELDIR=share/${pkgname}/examples/                    \
        -DDEAL_II_COMPONENT_DOCUMENTATION=OFF ${srcdir}/${_realname}-$pkgver

  # deal.II needs about 3 GB/compilation process so use fewer jobs if your
  # machine does not have the memory to support the maximum number.
  make $MAKEFLAGS

  cd "${srcdir}/build"
  echo "export DEAL_II_DIR=$_installation_prefix" > ./deal-ii.sh
}

check() {
    cd "${srcdir}/build"
    # workaround a bug by setting the number of jobs to 1 (though this still
    # runs in parallel)
    make -j1 test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # delete extra files that deal.II installs into the top level directory
  rm "${pkgdir}/${_installation_prefix}/LICENSE.md"
  rm "${pkgdir}/${_installation_prefix}/README.md"
  rm "${pkgdir}/${_installation_prefix}/detailed.log"
  rm "${pkgdir}/${_installation_prefix}/summary.log"

  install -D -m755 "${srcdir}/build/deal-ii.sh" "${pkgdir}/etc/profile.d/deal-ii.sh"
  install -D -m644 "${srcdir}/${_realname}-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${_realname}-$pkgver/LICENSE.md"
}
