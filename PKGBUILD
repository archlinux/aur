# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd
pkgver=20
_toolsver=20
_gccver=9.3.0
pkgrel=3
pkgdesc="PMEMD module of AMBER software package"
url="http://ambermd.org/"
license=(custom)
arch=(x86_64)
depends=(ambertools)
makedepends=('cmake>=3.8.1' make gcc9 flex bison patch tcsh imake openmpi-gcc9 'cuda>=7.5')
optdepends=('openmpi-gcc9: MPI support'
            'cuda: GPU acceleration support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'vmd: visualize trajectories')
options=(staticlibs !buildflags)

# Due to licensing issues you must register and download AmberTools package from AmberMD url and put it in directory with PKGBUILD.
# Moreover, you MUST purchase Amber package from AmberMD group and also place it in directory with PKGBUILD.
source=("local://AmberTools${_toolsver}.tar.bz2"
        "local://Amber${pkgver}.tar.bz2"
        "pmemd"
        "pmemd.MPI"
        "pmemd.cuda"
        "pmemd.cuda.MPI")
md5sums=('8c1fe81833796a9cb823019e02c522e0'
         '559d5b7b872344c268a62ebd5d33f71d'
         '44632310820b4d915a169d13d6a60be2'
         '9e030fb76a31f133a59b33734e674ac1'
         'eba440f07f04c80d2cb22752bea01d65'
         '14a2068da46e104553224fb523ea5bd4')

prepare() {
  cd ${srcdir}/amber${pkgver}_src

  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${pkgver}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-9 CXX=g++-9 FC=gfortran-9 cmake $AMBER_PREFIX/amber${pkgver}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCOMPILER=MANUAL  \
      -DMPI=TRUE -DCUDA=TRUE \
      -DOPENMP=TRUE \
      -DINSTALL_TESTS=FALSE \
      -DDOWNLOAD_MINICONDA=FALSE \
      -DFORCE_DISABLE_LIBS="plumed" \
      -DFORCE_INTERNAL_LIBS="arpack;xblas;netcdf;netcdf-fortran;pnetcdf;fftw;boost;mpi4py" \
      2>&1 | tee cmake.log

  cd src
  make
}

package() {
  mkdir -p ${pkgdir}/opt/amber

  # install stuff
  cd ${srcdir}/amber${pkgver}_src/build/src
  make DESTDIR=${pkgdir} install

  # install wrappers
  install -Dm755 ${srcdir}/pmemd ${pkgdir}/usr/bin/pmemd
  install -Dm755 ${srcdir}/pmemd.MPI ${pkgdir}/usr/bin/pmemd.MPI
  install -Dm755 ${srcdir}/pmemd.cuda ${pkgdir}/usr/bin/pmemd.cuda
  install -Dm755 ${srcdir}/pmemd.cuda.MPI ${pkgdir}/usr/bin/pmemd.cuda.MPI
}
