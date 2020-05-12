# Based on AUR petsc and petsc-git package. Adapted to my
# MOOSE requirements

# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=petsc-git
pkgver=20200512
pkgrel=1
_config=linux-c-opt
pkgdesc="Portable, extensible toolkit for scientific computation with MUMPS, Hypre, FFTW, HDF5, Scalapack, Suitesparse, Metis, Scotch, Superlu, OpenBLAS, Eigen, OpenMP, HWloc, CGNS, PNG, MED and trilinos"
provides=(petsc)
conflicts=(petsc)
arch=('i686' 'x86_64')
url="https://www.mcs.anl.gov/petsc/"
license=('BSD')
depends=('python2' 'openmpi' 'boost' 'lapack' 'fftw' 'hdf5')
makedepends=('gcc' 'gcc-fortran' 'cmake' 'sowing')
optdepends=("hdf5: large files"
            "fftw: Fast-Fourier Transform"
            "openblas: Linear algebra libraries"
            "scalapack: Parallel memory linear algebra"
            "mumps: Sparse solver library"
            "hypre: Large and sparse linear with massive parallel computing"
            "suitesparse: Sparse matrix library"
            "metis: Partitioning library (for meshes)"
            "scotch: Partitioning with sparse matrices"
            "superlu: Subroutines for sparsse linear systems"
            "eigen: Lightweight C++ template library for vector and matrix math"
            "openmp: Parallel distributed tasks"
            "hwloc: Portable Hardware Locality (abstraction of hierarchical architectures)"
            "cgns: Recording and recovering computer data"
            "png"
            "med>=4.0: Data Modelization and Exchanges (meshes)"
            "boost: Free peer-reviewed portable C++ source libraries"
            "yaml: configuration files"
            "opencl: GPU computing")
install=petsc.install
source=(petsc::git+https://gitlab.com/petsc/petsc.git#branch=maint
        test_optdepends.sh)
sha256sums=('SKIP'
            '2c21313b21b7a76ed4d39d040ef60462f8760ae3d4b76ff6aa717ebc43a2275b')

_petsc_arch="arch-${_config}"

#####################################################################
# From UPC: Building And Using Static And Shared "C" Libraries.html #
# #+begin_QUOTE                                                     #
# we need that all jump calls ("goto", in assembly speak)           #
# and subroutine calls will use relative addresses, and not         #
# absolute addresses. Thus, we need to use ... ~-fPIC~ or           #
# ~-fpic~                                                           #
# #+end_QUOTE                                                       #
#####################################################################
###############################################################################
#  From makepkg.conf                                                          #
# -march (or -mcpu) builds exclusively for an architecture                    #
# -mtune optimizes for an architecture, but builds for whole processor family #
###############################################################################
# -O3 optimises
generic_flags="-fPIC -fopenmp -O3 -march=x86-64 -mtune=generic"
# generic_flags="-fPIC -fopenmp -O3 -march=amdfam10 -mtune=generic"

export   COPTFLAGS=-O3
export CXXOPTFLAGS=-O3
export   FOPTFLAGS=-O3
export    CPPFLAGS="$generic_flags -O2 -D-FORTIFY-SOURCE=2"
export      CFLAGS="$generic_flags"
export    CXXFLAGS="$generic_flags"
export      FFLAGS="$generic_flags"
export     FCFLAGS="$generic_flags"
export    F90FLAGS="$generic_flags"
export    F77FLAGS="$generic_flags"


pkgver() {
  cd petsc
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}


prepare() {
  # force using python2
  MATCH='\(/usr/bin/env\|/usr/bin/\)python[[:digit:].]*'
  while IFS= read file; do
    sed -i "s#$MATCH#\\1python2#" "$file"
  done < <( find ${srcdir} -name "*" -type f -exec grep -le "$MATCH" \{\} + )

  cd "${srcdir}/petsc"
  # patch -p1 < ../patch.diff
  sed -i 's-\(self.publicInstall[^=]*=[[:space:]]\)[^#]*-\10 -g' config/BuildSystem/config/package.py

  sed -i "s/\(raise RuntimeError('--download-openblas libraries cannot be used')\)/#\1/" config/BuildSystem/config/packages/BlasLapack.py
}


build() {
  cd petsc

  declare -a CONFOPTS
  # Run python2 ./configure --help for the meaning of this
  CONFOPTS=(
    --COPTFLAGS="$COPTFLAGS"
    --CXXOPTFLAGS="CXXOPTFLAGS"
    --CPPFLAGS="$CPPFLAGS"
    --CFLAGS="$CFLAGS"
    --CXXFLAGS="$CXXFLAGS"
    --FFLAGS="$FFLAGS"
    --FCFLAGS="$FCFLAGS"
    --F90FLAGS="$F90FLAGS"
    --F77FLAGS="$F77FLAGS"

    --with-cxx-dialect=C++11
    --with-mpi=1
    --with-pic=1
    --with-shared-libraries=1
    --with-zlib=1

    --with-scalar-type=complex
    # Add this to test_optdepends.sh
    --with-opencl=1
    --with-yaml=1
  )

  # if --with-debugging=1 is set then PETSC_ARCH is automatically set to
  # "linux-c-debug" for some things, so _config should be changed to "linux-c-debug"
  #CONFOPTS="${CONFOPTS} --with-debugging=1"

  CONFOPTS=( "${CONFOPTS[@]}" $(sh "${srcdir}"/test_optdepends.sh) )

  dirpkg=${srcdir}/petsc/${_petsc_arch}/externalpackages/

  export PETSC_DIR="${srcdir}/petsc"
  export PETSC_ARCH="${_petsc_arch}"

  python2 ./configure LDFLAGS="$LDFLAGS" \
          --prefix=/usr/petsc/${_config} \
          --MAKEFLAGS="$MAKEFLAGS" \
          $(for (( i=1; i<=${#CONFOPTS[@]}; i++)); do
              echo "${CONFOPTS[$i]}";
            done)
  make clean
  make all
}

package() {
  cd petsc

  _build_dir="${srcdir}/petsc"
  _install_dir=/usr/petsc/${_config}

  export PETSC_DIR=${_build_dir}
  export PETSC_ARCH="${_petsc_arch}"

  make DESTDIR="${pkgdir}" install

  # documentation
  # Note: the hyperlinks between documentation, tutorials and examples are
  # not perfect yet
  #mkdir -p ${pkgdir}/usr/share/doc/petsc/
  #cp -r ${_build_dir}/docs ${pkgdir}/usr/share/doc/petsc/

  # src for tutorials
  #find ./src -path '*examples*' -type f -exec \
  #  install -Dm 644 "{}" "${pkgdir}/usr/share/doc/petsc/{}" \;

  # html versions of header files
  #mkdir -p ${pkgdir}/usr/share/doc/petsc/include
  #cp -r ${_build_dir}/include/*.html ${pkgdir}/usr/share/doc/petsc/include/

  # install license (even though there is no such word as licenses)
  install -Dm 644 ${_build_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p "${pkgdir}/etc/profile.d"
  echo "export PETSC_DIR=${_install_dir}" > "${pkgdir}/etc/profile.d/petsc.sh"
  chmod +x "${pkgdir}/etc/profile.d/petsc.sh"

  # show where the shared libraries are
  install -dm 755 "${pkgdir}/etc/ld.so.conf.d/"
  echo "${_install_dir}/lib" > "${pkgdir}/etc/ld.so.conf.d/petsc.conf"

  sed -i "s#-L${_build_dir}/${_petsc_arch}/lib ##" "${pkgdir}${_install_dir}/lib/pkgconfig/PETSc.pc"
}
