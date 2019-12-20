# Based on the AUR package, adapted to my PETSc
# (Metis, Hypre, OpenMPI, VTK, HDF5, ifem, nodeconstraint
# shared libraries; Methods: opt oprof dbg; x86_64)

pkgname=libmesh-petsc
realname=libmesh
pkgrel=1
pkgver=v1.5.1.r0.g2469f07a2
pkgdesc="A C++ Finite Element Library"
arch=("x86_64")
url="http://libmesh.github.io/"
license=('LGPL')
provides=($realname)
conflicts=($realname)
depends=('eigen' 'hdf5' 'boost-libs' 'intel-tbb' 'vtk' 'glpk' 'netcdf' 'nlopt' "petsc" "hypre" "openmpi" "metis")
makedepends=('bison')
# From tar.bz2
# source=("https://github.com/libMesh/libmesh/releases/download/v${pkgver}/libmesh-${pkgver}.tar.bz2")
# sha256sums=('638cf30d05c249315760f16cbae4804964db8857a04d5e640f37617bef17ab0f')
source=(
  "${realname}::git+https://github.com/libMesh/libmesh"
       )
md5sums=('SKIP')


pkgver() {
    cd $realname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # ln -s "${srcdir}/metaphysicl" "${srcdir}/${realname}/contrib/"
  cd "${srcdir}/${realname}"
  sed -i 's-=[[:space:]]*../../-=https://github.com/-g' .gitmodules
  git submodule sync --recursive
  git submodule update --init

  # By recommendation from Roy Stogner
  git checkout v1.5.1
}

build() {
  cd "${srcdir}/${realname}"

  petsc_h=$(pacman -Ql petsc | grep -m 1 petsc.h | sed 's-^[[:alpha:]-]* --g')
  petsc_dir=$(dirname "$petsc_h")
  export PETSC_DIR=${petsc_dir%%/include}

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

  # I used these for PETSc (from MOOSE)
  generic_flags="-fPIC -fopenmp -O3 -march=x86-64 -mtune=generic"
  export   COPTFLAGS=-O3
  export CPPOPTFLAGS=-O3
  export CXXOPTFLAGS=-O3
  export      CFLAGS="$generic_flags"
  # Fortify is optional
  export    CPPFLAGS="$generic_flags -D_FORTIFY_SOURCE=2"
  export    CXXFLAGS="$generic_flags"
  export      FFLAGS="$generic_flags"
  export     FCFLAGS="$generic_flags"
  export    F90FLAGS="$generic_flags"
  export    F77FLAGS="$generic_flags"

  # I used these for PETSc (from MOOSE)
  export METHODS="opt oprof dbg"

  CONFOPTS=(
    --enable-cxx11-required     # force C++11 standard
    --enable-petsc-hypre-required # recommended by MOOSE
    --with-metis=PETSc          # use PETSCs' metis
    --enable-metaphysicl-required # recommended by MOOSE
    --enable-vtk-required
    --enable-curl
    --enable-hdf5
    # --enable-complex            # make sure to compile PETSc with complex too
    --with-pic
    --enable-mpi
    --enable-fftw               # Does this work ?

    --enable-shared             # shared libraries
    --enable-unique-id          # from libmesh GitHub wiki
    --enable-march              # get -march flag for this system
    --enable-ifem               # infinite elements
    --enable-nodeconstraint     # from libmesh GitHub wiki
  )

  ./configure \
    --prefix=/usr \
    $(for (( i=1; i<=${#CONFOPTS[@]}; i++)); do
        echo "${CONFOPTS[$i]}";
      done)
  make clean
  make
  LC_ALL=C make DESTDIR="${pkgdir}"/usr/share/doc/${realname}/examples examples_doc
  LC_ALL=C make DESTDIR="${pkgdir}"/usr/share/doc/${realname}/html doc
}

check() {
    cd "${srcdir}/${realname}"
    make check
}

package() {
  cd "${srcdir}/${realname}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/doc/${realname}/"
  rsync -a examples "${pkgdir}/usr/share/doc/${realname}/" --exclude="example*.o"
  # Doing mv would be faster, but in case of repackaging, a new make is needed
  cp -a doc/html "${pkgdir}/usr/share/doc/${realname}/"
  install -d "${pkgdir}/etc/libmesh"
  mv "${pkgdir}"/usr/Make.common "${pkgdir}/usr/share/doc/libmesh/"
  mv "${pkgdir}"/usr/etc/libmesh/Make.common "${pkgdir}/etc/libmesh"

  rm -r "${pkgdir}"/usr/{contrib,examples} || echo "removed "
  rm "${pkgdir}"/usr/Make.common || echo "removed"
}
