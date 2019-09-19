# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=pmemd-cuda
pkgver=18
_toolsver=19
_gccver=7.4.1
pkgrel=1
pkgdesc="PMEMD module of AMBER software package (with CUDA support)"
url="http://ambermd.org/"
license=('custom')
arch=('x86_64')
depends=('openmpi3-gcc7' 'cuda' 'fakeroot' 'zlib' 'bzip2' 'gcc7-libs' 'flex' 'python2' 'bash')
makedepends=('make' 'gcc7' 'gcc7-fortran' 'patch' 'tcsh' 'imake')
optdepends=('plumed-patches: PLUMED support'
            'plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI')
md5sums=('afffe8a5473a0bd143b98f0396f52f0f'
         '6b38d9cfb6e33b719bdf7fe73b26e841'
         '6015e304e72538d84e6d44f883ac39c2'
         'c0e28736c9fe7ffd1cbed27ad3220e16'
         'b1b881bd9e0f64a463c5e54138a679a6'
         'c18bfebde8bd68bc6815e7e1ab17f154'
         'c223fda763779c4f78fe3c634cfa3d50')
options=(staticlibs !buildflags !makeflags)

# Due to licensing issues you must register and download AmberTools package from AmberMD url and put it in directory with PKGBUILD.
# Moreover, you MUST purchase Amber package from AmberMD group and also place it in directory with PKGBUILD.
source=("local://AmberTools${_toolsver}.tar.bz2"
        "local://Amber${pkgver}.tar.bz2"
        "amber.patch"
        "pmemd.cuda"
        "pmemd.cuda_DPFP"
        "pmemd.cuda.MPI"
        "pmemd.cuda_DPFP.MPI")

prepare() {
  cd ${srcdir}/amber${pkgver}

  export AMBERHOME="${srcdir}/amber${pkgver}"
  ./update_amber --update
  patch -Np0 -i "${srcdir}/amber.patch"
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

  export CUDA_HOME="/opt/cuda"
  export LD_LIBRARY_PATH="/opt/cuda/lib:/opt/cuda/lib64:${LD_LIBRARY_PATH}"

  # pre-configure
  cd ${srcdir}/amber${pkgver}
  LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates gnu

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

  # build serial CUDA version
  cd ${srcdir}/amber${pkgver}
  LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates -cuda gnu
  cd src
  make install

  # build parallel CUDA version
  cd ${srcdir}/amber${pkgver}
  LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates -cuda -mpi gnu
  cd src
  make install
}

package() {
  cd ${srcdir}/amber${pkgver}/bin

  # install binaries
  install -Dm755 pmemd.cuda_SPFP ${pkgdir}/usr/lib/${pkgname}/bin/pmemd.cuda_SPFP
  install -Dm755 pmemd.cuda_DPFP ${pkgdir}/usr/lib/${pkgname}/bin/pmemd.cuda_DPFP
  install -Dm755 pmemd.cuda_SPFP.MPI ${pkgdir}/usr/lib/${pkgname}/bin/pmemd.cuda_SPFP.MPI
  install -Dm755 pmemd.cuda_SPFP.MPI ${pkgdir}/usr/lib/${pkgname}/bin/pmemd.cuda_DPFP.MPI

  # install wrappers
  install -Dm755 ${srcdir}/pmemd.cuda ${pkgdir}/usr/bin/pmemd.cuda
  install -Dm755 ${srcdir}/pmemd.cuda_DPFP ${pkgdir}/usr/bin/pmemd.cuda_DPFP
  install -Dm755 ${srcdir}/pmemd.cuda.MPI ${pkgdir}/usr/bin/pmemd.cuda.MPI
  install -Dm755 ${srcdir}/pmemd.cuda_DPFP.MPI ${pkgdir}/usr/bin/pmemd.cuda_DPFP.MPI
}
