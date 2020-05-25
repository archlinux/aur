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
makedepends=('cmake>=3.8.1' make gcc8 flex bison patch tcsh imake openmpi-gcc8 'cuda>=7.5')
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
            '80e5c6538859f35e38ba4f2cdd877a4bb5e09aa524474e31291a5b840508b808'
            '2975cbdd087def9a982d09d15207dd32fa9b7c439ddab3c365ee7fee70823cba'
            'e6de44446d88c53155853bd8346a357cc6e58bcbffad47bd514ed0ce07b07143'
            'bb1c26e67c7926a2247f0f16112fe4ed3fcc687397c801dc32ceaea16a6af680'
            '5c7b10ae5690b8b161f2b1815bbd926481753781f149ea825e8c07fe4a284312')

prepare() {
  cd ${srcdir}/amber${_releasever}_src

  ./update_amber --update
}

build() {
  cd ${srcdir}/amber${_releasever}_src/build

  export AMBER_PREFIX="${srcdir}"

  CC=gcc-8 CXX=g++-8 FC=gfortran-8 cmake $AMBER_PREFIX/amber20_src \
      -DCMAKE_INSTALL_PREFIX=/opt/amber \
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
  mkdir -p ${pkgdir}/opt/amber

  cd ${srcdir}/amber${_releasever}_src/build
  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/opt/amber

  # install environment config file
  install -Dm755 ${srcdir}/amber.sh ./amber.sh

  # install other stuff
  install -Dm644 ${srcdir}/${pkgver} ${pkgdir}/opt/amber/share/modulefiles/ambertools/${pkgver}

  # install wrappers
  install -Dm755 ${srcdir}/sander ${pkgdir}/usr/bin/sander
  install -Dm755 ${srcdir}/sander.MPI ${pkgdir}/usr/bin/sander.MPI
  install -Dm755 ${srcdir}/sander.OMP ${pkgdir}/usr/bin/sander.OMP

  # cleanup
  find ${pkgdir}/opt -mindepth 1 -maxdepth 1 ! -name "amber" -exec rm -rf '{}' \;
  rm -f ${pkgdir}/opt/amber/amber.csh
  find ${pkgdir}/opt/amber/lib -name "*.pyc" -type f -delete

  # fix buildroot traces
  sed -i "s#${srcdir}/amber${pkgver}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build/AmberTools/src/xblas/build#/opt/amber/lib#" ${pkgdir}/opt/amber/AmberTools/src/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build#/opt/amber#" ${pkgdir}/opt/amber/config.h
  sed -i "s#${srcdir}/amber${pkgver}_src/build#/opt/amber#" ${pkgdir}/opt/amber/AmberTools/src/config.h
}
