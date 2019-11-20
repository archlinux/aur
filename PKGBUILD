# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
_srcname=amber
pkgver=19
_releasever=18
_gccver=8.3.0
pkgrel=5
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=('GPL' 'LGPL')
arch=('x86_64')
depends=('fakeroot' 'zlib' 'bzip2' 'gcc8-libs' 'flex' 'python2' 'python2-matplotlib' 'tk' 'openmpi3-gcc8')
makedepends=('make' 'gcc8' 'gcc8-fortran' 'patch' 'tcsh' 'imake')
optdepends=('plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'cuda: GPU acceleration support for PBSA and CPPTRAJ'
            'env-modules-tcl: modulefile support')
md5sums=('afffe8a5473a0bd143b98f0396f52f0f'
         '954a26eb9c71cbc21ccad8506030ae35'
         'eff0977b0c5d2da8ea74186dadd9ed01'
         '2e4a52fb820aae6a0b707fec89cb23d1'
         '94c0e67fac1a7e182fa71c165980d69d'
         '860a64577fe9e4d8b236b7eb2a252327'
         '20e82439a05f3abdca9c0dcdd2695e6f')
options=(staticlibs !buildflags !makeflags)
install=amber.install

# Due to licensing issues you must register and download the package from the AmberMD url and put it in the PKGBUILD folder!
source=("local://AmberTools${pkgver}.tar.bz2"
        "amber.sh"
        "amber.sysusers"
        "amber.patch"
        "${pkgver}"
        "sander"
        "sander.MPI")

prepare() {
  cd ${srcdir}/${_srcname}${_releasever}

  export AMBERHOME=${srcdir}/${_srcname}${_releasever}
  ./update_amber --update

  # fix issue with linking CUDA libraries
  patch -Np0 -i "${srcdir}/amber.patch"
}

build() {
  cd ${srcdir}/${_srcname}${_releasever}

  # set necessary variables
  export LD_PRELOAD=/usr/lib/libstdc++.so
  export AMBER_PREFIX="${srcdir}/${_srcname}${_releasever}"
  export AMBERHOME="${srcdir}/${_srcname}${_releasever}"
  export PATH="${AMBER_PREFIX}/bin:${PATH}"

  if [ -z "$PYTHONPATH" ]; then
      export PYTHONPATH="${AMBER_PREFIX}/lib/python2.7/site-packages"
  else
      export PYTHONPATH="${AMBER_PREFIX}/lib/python2.7/site-packages:${PYTHONPATH}"
  fi

  if [ -z "${LD_LIBRARY_PATH}" ]; then
     export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib"
  else
     export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib:${LD_LIBRARY_PATH}"
  fi

  export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:${LD_LIBRARY_PATH}"

  # configure and build serial version of AmberTools
  LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates gnu
  make install

  # configure and build parallel version of AmberTools
  LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates -mpi gnu
  make install

  # if CUDA is installed then build extra binaries
  if [ -d "/opt/cuda" ]; then
      export CUDA_HOME="/opt/cuda"
      export LD_LIBRARY_PATH="/opt/cuda/lib:/opt/cuda/lib64:${LD_LIBRARY_PATH}"

      LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates -cuda gnu
      make install

      LANG=en_US.UTF-8 CC=gcc-8 CXX=g++-8 FC=gfortran-8 ./configure --with-python /usr/bin/python2 --no-updates -cuda -mpi gnu
      make install
  fi
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}

  cd ${srcdir}/${_srcname}${_releasever}
  cp -ar bin dat include lib lib64 ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # fix buildroot traces
  sed -i "s#${srcdir}/${_srcname}${_releasever}#/opt/${pkgname}#" lib/pkgconfig/fftw3.pc
  find ${pkgdir}/opt/${pkgname}/lib -name "*.pyc" -type f -delete

  # install environment config file
  install -Dm755 ${srcdir}/amber.sh ./amber.sh

  # install stuff
  install -Dm644 ${srcdir}/${pkgver} ${pkgdir}/opt/${pkgname}/share/modulefiles/ambertools/${pkgver}
  install -Dm644 ${srcdir}/amber.sysusers ${pkgdir}/usr/lib/sysusers.d/amber.conf

  # install wrappers
  install -Dm755 ${srcdir}/sander ${pkgdir}/usr/bin/sander
  install -Dm755 ${srcdir}/sander.MPI ${pkgdir}/usr/bin/sander.MPI

  # fix permissions
  chown -R root:4535 ${pkgdir}/opt/${pkgname}
}
