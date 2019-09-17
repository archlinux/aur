# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
_srcname=amber
pkgver=19
_releasever=18
_gccver=7.4.1
pkgrel=2
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=('GPL' 'LGPL')
arch=('x86_64')
depends=('fakeroot' 'zlib' 'bzip2' 'gcc7-libs' 'flex' 'python2' 'python2-matplotlib' 'tk' 'openmpi3-gcc7')
makedepends=('make' 'gcc7' 'gcc7-fortran' 'patch' 'tcsh' 'imake')
optdepends=('plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'cuda: GPU acceleration support for PBSA and CPPTRAJ'
            'env-modules-tcl: modulefile support')
md5sums=('afffe8a5473a0bd143b98f0396f52f0f'
         '89d470dc64e054d07b9906344d1218ec'
         'eff0977b0c5d2da8ea74186dadd9ed01'
         '2e4a52fb820aae6a0b707fec89cb23d1'
         '5b1c2586560377ff39726b83143bd9fd'
         '2fe2fd85a6312f7847fba8e7c2d49896'
         'b6a324cd278a0818c87ac2cd802614a5')
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
  LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates gnu
  make install

  # configure and build parallel version of AmberTools
  LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates -mpi gnu
  make install

  # if CUDA is installed then build extra binaries
  if [ -d "/opt/cuda" ]; then
      export CUDA_HOME="/opt/cuda"
      export LD_LIBRARY_PATH="/opt/cuda/lib:/opt/cuda/lib64:${LD_LIBRARY_PATH}"

      LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates -cuda gnu
      make install

      LANG=en_US.UTF-8 CC=gcc-7 CXX=g++-7 FC=gfortran-7 ./configure --with-python /usr/bin/python2 --no-updates -cuda -mpi gnu
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
