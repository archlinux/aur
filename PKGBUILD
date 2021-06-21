# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd
pkgver=20
_toolsver=21
pkgrel=8
pkgdesc="PMEMD module of AMBER software package"
url="http://ambermd.org/"
license=(custom)
arch=(x86_64)
depends=(ambertools)
makedepends=('cmake>=3.10' make gcc10 gcc10-fortran flex bison patch tcsh imake openmpi-gcc10 'cuda>=11.1')
optdepends=('openmpi-gcc10: MPI support'
            'cuda: GPU acceleration support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'vmd: visualize trajectories')
options=(!buildflags)

# Due to licensing issues you must register and download AmberTools package from AmberMD url and put it in directory with PKGBUILD.
# Moreover, you MUST purchase Amber package from AmberMD group and also place it in directory with PKGBUILD.
source=("local://AmberTools${_toolsver}.tar.bz2"
        "local://Amber${pkgver}.tar.bz2"
        "pmemd"
        "pmemd.MPI"
        "pmemd.cuda"
        "pmemd.cuda.MPI")
sha256sums=('f55fa930598d5a8e9749e8a22d1f25cab7fcf911d98570e35365dd7f262aaafd'
            'a4c53639441c8cc85adee397933d07856cc4a723c82c6bea585cd76c197ead75'
            '2e7418cf146654c31f524a4e88afdc7a15d6151246beaad25c564676df492670'
            '340c9dcfc5eddf05aeb30681f9e3ea422601f95f5d73c528b58296c3f3cbf8d2'
            'ec3051b823c01d34c04096f5babc74d1619abb8cf4ea8e78139af4fb66e11b34'
            'e776cd7b01f6f7bbb2668c3d9822de6f842c1ce963f24f017829a50e47a90fad')

prepare() {
  cd ${srcdir}/amber${pkgver}_src

  # apply updates manually
  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${pkgver}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-10 CXX=g++-10 FC=gfortran-10 cmake $AMBER_PREFIX/amber${pkgver}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCHECK_UPDATES=FALSE \
      -DCOMPILER=MANUAL \
      -DMPI=TRUE -DCUDA=TRUE \
      -DOPENMP=TRUE \
      -DINSTALL_TESTS=FALSE \
      -DDOWNLOAD_MINICONDA=FALSE \
      -DFORCE_DISABLE_LIBS="plumed" \
      -DFORCE_INTERNAL_LIBS="arpack;xblas;netcdf;netcdf-fortran;pnetcdf;mpi4py;fftw" \
      -DFORCE_EXTERNAL_LIBS="boost" \
      -Wno-dev \
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
