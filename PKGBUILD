# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
pkgver=21
_releasever=20
pkgrel=2
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(boost zlib bzip2 gcc10-fortran tk libx11 libxext blas lapack python python-numpy python-scipy python-matplotlib python-setuptools perl perl-chemistry-mol)
makedepends=('cmake>=3.10' make gcc10 flex bison patch tcsh imake openmpi-gcc10 'cuda>=11.1')
optdepends=('openmpi-gcc10: MPI support'
            'cuda: GPU acceleration support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'vmd: visualize trajectories'
            'env-modules-tcl: modulefile support')
options=(!buildflags)

# Due to licensing issues you must register and download the package from the AmberMD url and put it in the PKGBUILD folder!
source=("local://AmberTools${pkgver}.tar.bz2"
        "amber.sh"
        "${pkgver}"
        "sander"
        "sander.MPI"
        "sander.OMP"
        ".version")
sha256sums=('f55fa930598d5a8e9749e8a22d1f25cab7fcf911d98570e35365dd7f262aaafd'
            '95f8cb643104df144546ab2209540671cd17c04d19ec8679813cc9117e61b51b'
            'a907e22c0315d3cbd3db8949125113faa586b1812fc0682acb8a4b3ac12ad9d3'
            '541e1fcb72f34264af40b0b1034c27ef2bdd6338280c87ff2fe9c772240e7aa3'
            'bc6b155b71e088b47f9c088064f3b6a7e41543631cba1854cebb69df04f338e0'
            '147cc5ae0856f3d3b8e52041923e235d1979e6658a1f454199600390a8c29192'
            '3f7d7a0cae1531ad36513ec554cae302e78b2b574026e5dbfacf9a0d0c72b1cc')

prepare() {
  cd ${srcdir}/amber${_releasever}_src

  # apply updates manually
  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${_releasever}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-10 CXX=g++-10 FC=gfortran-10 cmake $AMBER_PREFIX/amber${_releasever}_src \
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

  make
}

package() {
  mkdir -p ${pkgdir}/opt/amber

  # install stuff
  cd ${srcdir}/amber${_releasever}_src/build
  make DESTDIR=${pkgdir} install

  # install environment config file
  cd ${pkgdir}/opt/amber
  install -Dm755 ${srcdir}/amber.sh ./amber.sh

  # install other stuff
  install -Dm644 ${srcdir}/${pkgver} ${pkgdir}/opt/amber/share/modulefiles/ambertools/${pkgver}
  install -Dm644 ${srcdir}/.version ${pkgdir}/opt/amber/share/modulefiles/ambertools/.version

  # install wrappers
  install -Dm755 ${srcdir}/sander ${pkgdir}/usr/bin/sander
  install -Dm755 ${srcdir}/sander.MPI ${pkgdir}/usr/bin/sander.MPI
  install -Dm755 ${srcdir}/sander.OMP ${pkgdir}/usr/bin/sander.OMP

  # cleanup
  find ${pkgdir}/opt -mindepth 1 -maxdepth 1 ! -name "amber" -exec rm -rf '{}' \;
  rm -f ${pkgdir}/opt/amber/amber.csh
  find ${pkgdir}/opt/amber/lib -name "*.pyc" -type f -delete

  # fix buildroot traces
  sed -i "s#${srcdir}/amber${_releasever}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build#/opt/amber#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src/build#/opt/amber#" ${pkgdir}/opt/amber/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src#/opt/amber#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${_releasever}_src#/opt/amber#" ${pkgdir}/opt/amber/AmberTools/src/config.h
}
