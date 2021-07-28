# Based on the AUR package, adapted to my PETSc
# (Metis, Hypre, OpenMPI, VTK, HDF5, ifem, nodeconstraint
# shared libraries; Methods: opt oprof dbg; x86_64)

pkgname=libmesh-petsc
pkgbase=libmesh
pkgrel=1
pkgver=cpp03_final.r6057.gd18d49ad7
pkgdesc="A C++ Finite Element Library"
arch=("x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
provides=($pkgbase "metaphysicl" "timpi")
conflicts=($pkgbase)
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt' "petsc" "hypre=2.18.2" "openmpi" "metis")
makedepends=('bison' 'coreutils')
# From tar.bz2
# source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
# sha256sums=('638cf30d05c249315760f16cbae4804964db8857a04d5e640f37617bef17ab0f')
source=(
  "${pkgbase}::git+https://github.com/libMesh/libmesh"
  "netcdf.m4.patch"
  "0001-Avoid-calling-virtual-function-from-DenseMatrix-resi.patch"
)
sha256sums=('SKIP'
            'b6b2d10d1f423b9a088e6b55d9368d8f1ac7291646da34864c5f58124f5e3880'
            'da0ef283dcee18dbe2878d4b998a82d83dbf94323146cf257bc77304427533d4')

# Find the location of the header files of PETSc
# Get the PETSc directory
petsc_incl=$(pkgconf --cflags-only-I PETSc)
export PETSC_DIR=${petsc_incl##-I}

#  From UPC: Building And Using Static And Shared "C"
#  Libraries.html
# #+begin_QUOTE
# we need that all jump calls ("goto", in assembly speak)
# and subroutine calls will use relative addresses, and not
# absolute addresses. Thus, we need to use ... ~-fPIC~ or
# ~-fpic~
# #+end_QUOTE
#
#  From makepkg.conf
# -march (or -mcpu) builds exclusively for an architecture
# -mtune optimizes for an architecture, but builds for
#  whole processor family
#
# -O3 optimises
#
# -D-FORTIFY-SOURCE=2
# | https://stackoverflow.com/a/16604146
# |- man 7 feature_test_macros
# checks to be performed to detect some buffer overflow
# errors when employing various string and memory
# manipulation functions ... some  conforming programs
# might fail
#
# -fcf-protection
# | Info pages for gcc (gnu compiler collection)
# intended to protect against such threats as
# Return-oriented Programming (ROP), and similarly
# call/jmp-oriented programming (COP/JOP)
#
# -pipe
# | Info pages for gcc (controlling the kind of output)
# Use pipes rather than temporary files for communication
# between the various stages of compilation
#
# -fno-plt
# | Info pages for gcc (code generation conventions)
# leads to more efficient code by eliminating PLT stubs and
# exposing GOT loads to optimizations
#
# -fopenmp
# | Info pages for gcc (controlling c dialect)
# Enable handling of OpenMP directives

# I used these for PETSc (from MOOSE)
# safe_flags="-D-FORTIFY-SOURCE=2 -fcf-protection -fno-plt -fstack-clash-protection -Wformat -Werror=format-security"
safe_flags="-Wp,-D_FORTIFY_SOURCE=2,-D_GLIBCXX_ASSERTIONS -fcf-protection -fno-plt -fstack-clash-protection -Wformat -Werror=format-security"
generic_flags="-pipe -fno-plt -fPIC -fopenmp -march=x86-64 -mtune=generic ${safe_flags}"
opt_flags="${generic_flags} -O3"
generic_flags="${generic_flags} -O2"

export COPTFLAGS="${opt_flags}"
export CXXOPTFLAGS="$COPTFLAGS"
export FOPTFLAGS="$COPTFLAGS"
export CPPFLAGS="$generic_flags"
export CXXFLAGS="$CPPFLAGS"
export CFLAGS="$generic_flags"
export FFLAGS="$generic_flags"
export FCFLAGS="$generic_flags"
export F90FLAGS="$generic_flags"
export F77FLAGS="$generic_flags"
# I used these (from MOOSE)
# export METHODS="opt oprof dbg"
export METHODS="opt dbg"

export CC=mpicc CXX=mpicxx FC=mpifort
export PETSC_DIR=/usr/Local/petsc

# Use English, metres, dates like the rest of us
export LANG=en_IE.UTF-8 LANGUAGE=en_IE.UTF-8 LC_ALL=en_IE.UTF-8

pkgver() {
  cd $pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  buildir="${srcdir}"/build
  # Directory for out of source build
  [[ -d "${buildir}" ]] || mkdir "${buildir}"

  # Update Git sub-modules
  cd "${srcdir}/${pkgbase}"
  sed -i 's-=[[:space:]]*../../-=https://github.com/-g' .gitmodules
  git submodule sync --recursive
  git submodule update --init

  # Replace contrib/netcdf with system netcdf if available
  # (reminder -d: go to the right dir; by default the
  # directories are removed from path)
  patch -d "${srcdir}"/libmesh/m4 -i "${srcdir}"/netcdf.m4.patch
  cd "${srcdir}/${pkgbase}"
  autoconf
  [[ -f /usr/include/netcdf.h ]] && \
    sed -i "s-\(ac_subdirs_all='\)contrib/netcdf/v4-\1-g; s-\(subdirs=\"\$subdirs\) contrib/netcdf/v4-\1-g" configure
  patch -d "${srcdir}"/"${pkgbase}" -p1 -i "${srcdir}"/0001-Avoid-calling-virtual-function-from-DenseMatrix-resi.patch
}

build() {
  # This happens in ${pkgdir} (out-of-source)
  # Out of source build (recommended by Roy Stogner)
  buildir="${srcdir}"/build
  cd "${buildir}"

  CONFOPTS=(
    --quiet
    --srcdir="${srcdir}/${pkgbase}"
    # target directory
    --prefix=/usr
    # read-only single-machine data (Make.common)
    --sysconfdir=/etc/
    # Binary directory
    --bindir=/usr/bin
    # Base data dir (affects doc and others)
    --datadir=/usr/share
    # Make sure that the documentation is in the right place (does not work)
    --docdir=/usr/share/doc/libmesh
    # use relative addresses for jumps
    --with-pic
    # get -march flag for this system
    --enable-march
    # shared libraries
    --enable-shared

    # force C++11 standard (todo: check for update)
    --enable-cxx11-required
    # recommended by MOOSE
    --enable-petsc-hypre-required
    # recommended by MOOSE
    --enable-metaphysicl-required
    # Complex numbers
    # make sure to compile PETSc with complex too
    --enable-complex
    # CURL
    --enable-curl
    # FFTW
    --enable-fftw
    # HDF5
    --enable-hdf5
    # OpenMPI
    --enable-mpi
    # METIS
    # use PETSCs' metis
    --with-metis=/usr/lib/
    --with-metis-include=/usr/include/
    # MUMPS
    --enable-mumps
    --with-mumps=/usr/include
    --with-mumps-lib=/usr/lib
    # NETCDF
    --enable-netcdf
    --with-netcdf=/usr/include
    --with-netcdf-lib=/usr/lib
    # NLOPT
    --with-nlopt=/usr/include
    --with-nlopt-lib=/usr/lib
    # VTK
    --enable-vtk-required

    # infinite elements
    --enable-ifem
    --enable-unique-id          # from libmesh GitHub wiki
    --enable-nodeconstraint     # from libmesh GitHub wiki

    --enable-superlu            # Does this work ?
  )

  # Configure
  local config_file="${srcdir}/${pkgbase}"/configure
  CC=mpicc \
    CXX=mpicxx \
    FC=mpifort \
    PETSC_DIR=/usr/local/petsc/linux-c-opt \
    OMPI_MCA_opal_warn_on_missing_libcuda=0 \
    $config_file $(for (( i=1; i<=${#CONFOPTS[@]}; i++)); do
                   echo "${CONFOPTS[$i]}";
                 done)

  # Actual build
  make
  # Is there a way to directly install the documentation in
  # the right place?
  make doc
  make examples_doc
}

check() {
  buildir="${srcdir}"/build
  cd "${buildir}"
  make check
}

package() {
  export OMPI_MCA_opal_warn_on_missing_libcuda=0
  _buildir="${srcdir}"/build

  cd "${_buildir}"
  make DESTDIR="${pkgdir}" install

  _docdir="${pkgdir}"/usr/share/doc/libmesh/
  install -d "${_docdir}"
  install -d "${_docdir}"/examples

  # Move libtool (and contrib) to usr/share/libmesh
  mv "${pkgdir}/usr/contrib" "${pkgdir}/usr/share/libmesh/"
  # Set right path for libtool from libMesh
  sed -i 's-/usr/contrib/bin/libtool-/usr/share/libmesh/bin/libtool-g' "${pkgdir}"/{etc/libmesh,usr/lib/pkgconfig}/Make.common

  # Place examples and documentation in the right directory
  install -d "${pkgdir}"/usr/share/doc/
  cp -a "${_buildir}"/doc/html "${_docdir}"
  mv "${pkgdir}"/usr/examples "${pkgdir}"/usr/share/doc/libmesh/
  # Make local links to the source of the examples
  find "${_docdir}"/html/examples -type f -name '*.html' \
       -exec sed -i 's-https://github.com/libMesh/libmesh/tree/master/examples/\([^/]*\)/\1_\(ex\)-/usr/share/doc/libmesh/examples/\1/\2-g' \{\} +
  # Remove calls to analytics and prying eyes
  find "${_docdir}" -type f -exec \
       sed -i 's_google_google-removed_g' \{\} +

  # Set right path for Make.common
  find "${_docdir}"/examples -type f -name Makefile \
       -exec sed -i 's-\(LIBMESH_DIR[^=]*=\).*-\1 /etc/libmesh/-g' \{\} +
  # Set right path for run_common.sh
  find "${_docdir}"/examples -type f -name 'run.sh' \
       -exec sed -i 's-source LIBMESH_DIR/examples/.*-source /usr/share/doc/libmesh/examples/-g' \{\} +

  # Remove /usr/Make.common (already in /etc/libmesh)
  rm -f "${pkgdir}"/usr/Make.common || echo "removed"
}
