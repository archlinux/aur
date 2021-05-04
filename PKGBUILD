# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd
pkgver=20
_toolsver=21
pkgrel=7
pkgdesc="PMEMD module of AMBER software package"
url="http://ambermd.org/"
license=(custom)
arch=(x86_64)
depends=(ambertools)
makedepends=('cmake>=3.10' make gcc flex bison patch tcsh imake openmpi 'cuda>=11.1')
optdepends=('openmpi: MPI support'
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
            '2c954683c1176f49f29c4899208ef3ae7ec4b050dd1f891c71998f4f27b1cd5a'
            '41f59ec0c13cdda7584f351d83d2238060cf22b95fb53ea476152664116bfcae'
            '11f0225dd52ebfa214cc88ac34a2e037924551e2c1f715876b167e2782c187d8'
            '8cbdffefa5ac731283d10d9b1daa32d2e20ffe4c5aec34525042c36f664cf766')

prepare() {
  cd ${srcdir}/amber${pkgver}_src

  # apply updates manually
  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${pkgver}_src/build

  export AMBER_PREFIX="${srcdir}"

  cmake $AMBER_PREFIX/amber${pkgver}_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
      -DCHECK_UPDATES=FALSE \
      -DCOMPILER=GNU  \
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
