# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd
pkgver=20
_toolsver=20
_gccver=9.3.0
pkgrel=6
pkgdesc="PMEMD module of AMBER software package"
url="http://ambermd.org/"
license=(custom)
arch=(x86_64)
depends=(ambertools)
makedepends=('cmake>=3.8.1' make gcc9 flex bison patch tcsh imake openmpi-gcc9 'cuda>=10.1')
optdepends=('openmpi-gcc9: MPI support'
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
        "pmemd.cuda.MPI"
        "cuda-11.1.patch")
sha256sums=('b1e1f8f277c54e88abc9f590e788bbb2f7a49bcff5e8d8a6eacfaf332a4890f9'
            'a4c53639441c8cc85adee397933d07856cc4a723c82c6bea585cd76c197ead75'
            '8bd1f818e0b55e866b906ecd497831f674b9a7b995c85899f6c4adc77a908f51'
            'd454d03f3c88efe231a2282758c0e6b655396d00af40fd4b3ecfb1d8641009b7'
            '2a4a139923fcecbe319ae6728a860e8e64835c1dd2d9e626eb5125116a0d790c'
            'df8b260dc4782a0fd0935ba1fdec8eb013b17c1082cfecff60e933a38a38d5a0'
            'b666b2f186c5fd40b0be71a52b854060deea690205dbca24606c13c97cbf07de')

prepare() {
  cd ${srcdir}/amber${pkgver}_src

  ./update_amber --update

  patch -Np0 -i "${srcdir}/cuda-11.1.patch"
}

build() {
  cd ${srcdir}/amber${pkgver}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-9 CXX=g++-9 FC=gfortran-9 cmake $AMBER_PREFIX/amber${pkgver}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCHECK_UPDATES=FALSE \
      -DCOMPILER=MANUAL  \
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
