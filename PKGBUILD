# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd
pkgver=18
_toolsver=19
_gccver=8.3.0
pkgrel=2
pkgdesc="PMEMD module of AMBER software package"
url="http://ambermd.org/"
license=('custom')
arch=('x86_64')
depends=('openmpi3-gcc8' 'fakeroot' 'zlib' 'bzip2' 'gcc8-libs' 'flex' 'python2')
makedepends=('make' 'gcc8' 'gcc8-fortran' 'tcsh' 'imake' 'patch')
optdepends=('plumed-patches: PLUMED support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI')
md5sums=('afffe8a5473a0bd143b98f0396f52f0f'
         '6b38d9cfb6e33b719bdf7fe73b26e841'
         'ef2dc0fec7e716075c044a019d8f8f0c'
         'a4fe6129d03ad814744b85584d1aba9a')
options=(staticlibs !buildflags !makeflags)

# Due to licensing issues you must register and download AmberTools package from AmberMD url and put it in directory with PKGBUILD.
# Moreover, you MUST purchase Amber package from AmberMD group and also place it in directory with PKGBUILD.
source=("local://AmberTools${_toolsver}.tar.bz2"
        "local://Amber${pkgver}.tar.bz2"
        "pmemd"
        "pmemd.MPI")

prepare() {
  cd ${srcdir}/amber${pkgver}

  export AMBERHOME="${srcdir}/amber${pkgver}"
  ./update_amber --update
}

build() {
  # set necessary variables
  export LD_PRELOAD=/usr/lib/libstdc++.so
  export AMBER_PREFIX="${srcdir}/amber${pkgver}"
  export AMBERHOME="${srcdir}/amber${pkgver}"

  if [ -z "${LD_LIBRARY_PATH}" ]; then
     export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib"
  else
     export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib:${LD_LIBRARY_PATH}"
  fi

  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:${LD_LIBRARY_PATH}"

  # build serial version
  cd ${srcdir}/amber${pkgver}
  LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates gnu

  # add support for PLUMED
  if [ -e "/usr/bin/plumed-mpi-patch" -a -e "/usr/lib/plumed-mpi/patches/amber${pkgver}.diff" ]; then
    msg2 "Adding support for PLUMED (with MPI)"
    plumed-mpi-patch -p -e amber${pkgver}
  elif [ -e "/usr/bin/plumed-patch" -a -e "/usr/lib/plumed/patches/amber${pkgver}.diff" ]; then
    msg2 "Adding support for PLUMED"
    plumed-patch -p -e amber${pkgver}
  fi

  # build internal libraries
  cd ${srcdir}/amber${pkgver}/AmberTools/src/xblas
  make lib-amb
  mv libxblas-amb.a ../../../lib

  cd ${srcdir}/amber${pkgver}/AmberTools/src/blas
  make install

  cd ${srcdir}/amber${pkgver}/AmberTools/src/lapack
  make install

  cd ${srcdir}/amber${pkgver}/AmberTools/src/arpack
  make install

  cd ${srcdir}/amber${pkgver}/src
  make install

  # build parallel version
  cd ${srcdir}/amber${pkgver}
  LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates -mpi gnu
  cd ${srcdir}/amber${pkgver}/src
  make install
}

package() {
  cd ${srcdir}/amber${pkgver}/bin

  # install binaries
  install -Dm755 pmemd ${pkgdir}/usr/lib/${pkgname}/bin/pmemd
  install -Dm755 pmemd.MPI ${pkgdir}/usr/lib/${pkgname}/bin/pmemd.MPI

  # install wrappers
  install -Dm755 ${srcdir}/pmemd ${pkgdir}/usr/bin/pmemd
  install -Dm755 ${srcdir}/pmemd.MPI ${pkgdir}/usr/bin/pmemd.MPI
}
