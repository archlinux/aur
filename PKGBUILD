# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
pkgver=20
_releasever=20
_gccver=8.4.0
pkgrel=1
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(zlib bzip2 gcc8-libs gcc8-fortran tk libx11 libxext blas lapack python python-numpy python-scipy python-matplotlib python-setuptools perl perl-chemistry-mol)
makedepends=('cmake>=3.8.1' make gcc8 gcc8-fortran flex bison patch tcsh imake openmpi-gcc8 'cuda>=7.5')
optdepends=('openmpi-gcc8: MPI support'
            'cuda: GPU acceleration support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'env-modules-tcl: modulefile support')
options=(staticlibs !buildflags)

# Due to licensing issues you must register and download the package from the AmberMD url and put it in the PKGBUILD folder!
source=("local://AmberTools${pkgver}.tar.bz2"
        "amber.sh"
        "${pkgver}"
        "sander"
        "sander.MPI"
        "sander.OMP")
sha256sums=('b1e1f8f277c54e88abc9f590e788bbb2f7a49bcff5e8d8a6eacfaf332a4890f9'
            'adcbe39de29eda73c2b24ff61351982197b657a461d399e98e52e151b0a5063c'
            'b1be6e11d4a05b63e02719efdeda232178dd2e0124ae24067abb1d5f7064749c'
            'a72bf10dbd55807c62e619b269aadbfa1ffdf89a2ac4aaaa9f4a969c48dbf501'
            '68a6461768f25977f106caa697589f05ba2bb2283f213178f6ebbbb696d57a28'
            '515dc145b062b7f8af87031fe7bbdec8f60482d03aef86a5da7308a6a0e7d34d')

prepare() {
  cd ${srcdir}/amber${_releasever}_src

  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${_releasever}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-8 CXX=g++-8 FC=gfortran-8 cmake $AMBER_PREFIX/amber20_src \
      -DCMAKE_INSTALL_PREFIX=/opt/${pkgname} \
      -DCOMPILER=MANUAL  \
      -DMPI=TRUE -DCUDA=TRUE \
      -DOPENMP=TRUE \
      -DINSTALL_TESTS=TRUE \
      -DDOWNLOAD_MINICONDA=FALSE \
      -DFORCE_DISABLE_LIBS="plumed" \
      -DFORCE_INTERNAL_LIBS="arpack;xblas;netcdf;netcdf-fortran;pnetcdf;fftw;boost;mpi4py" \
      2>&1 | tee cmake.log
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}

  cd ${srcdir}/amber${_releasever}_src/build
  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/opt/${pkgname}

  # install environment config file
  install -Dm755 ${srcdir}/amber.sh ./amber.sh

  # install other stuff
  install -Dm644 ${srcdir}/${pkgver} ${pkgdir}/opt/${pkgname}/share/modulefiles/ambertools/${pkgver}

  # install wrappers
  install -Dm755 ${srcdir}/sander ${pkgdir}/usr/bin/sander
  install -Dm755 ${srcdir}/sander.MPI ${pkgdir}/usr/bin/sander.MPI
  install -Dm755 ${srcdir}/sander.OMP ${pkgdir}/usr/bin/sander.OMP

  # cleanup
  find ${pkgdir}/opt -mindepth 1 -maxdepth 1 ! -name "ambertools" -exec rm -rf '{}' \;
  rm -f ${pkgdir}/opt/${pkgname}/amber.csh
  find ${pkgdir}/opt/${pkgname}/lib -name "*.pyc" -type f -delete

  # fix buildroot traces
  sed -i "s#${srcdir}/amber${pkgver}_src/build/AmberTools/src/xblas/build#/opt/${pkgname}/lib#" ${pkgdir}/opt/${pkgname}/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build/AmberTools/src/xblas/build#/opt/${pkgname}/lib#" ${pkgdir}/opt/${pkgname}/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build#/opt/${pkgname}#" ${pkgdir}/opt/${pkgname}/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build#/opt/${pkgname}#" ${pkgdir}/opt/${pkgname}/AmberTools/src/config.h
}
