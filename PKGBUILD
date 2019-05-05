# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=ambertools
_srcname=amber
pkgver=19
_releasever=18
pkgrel=1
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=('custom')
arch=('x86_64')
depends=('fakeroot' 'zlib' 'bzip2' 'gcc-libs' 'flex' 'python2' 'python2-matplotlib' 'tk' 'boost' 'netcdf' 'netcdf-fortran' 'openmpi<4.0.0')
makedepends=('make' 'gcc' 'gcc-fortran' 'patch' 'tcsh' 'imake')
optdepends=('plumed: metadynamics support'
            'plumed-mpi: metadynamics support with MPI'
            'cuda: GPU acceleration support for PBSA and CPPTRAJ'
            'env-modules-tcl: modulefile support')
md5sums=('afffe8a5473a0bd143b98f0396f52f0f'
         '89d470dc64e054d07b9906344d1218ec'
         'eff0977b0c5d2da8ea74186dadd9ed01'
         '2e4a52fb820aae6a0b707fec89cb23d1'
         '5b1c2586560377ff39726b83143bd9fd')
options=(staticlibs !buildflags !makeflags)
install=amber.install

# Due to licensing issues you must register and download the package from the AmberMD url and put it in the PKGBUILD folder!
source=("local://AmberTools${pkgver}.tar.bz2"
        "amber.sh"
        "amber.sysusers"
        "amber.patch"
        "${pkgver}")

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

  # configure and build serial version of AmberTools
  LANG=en_US.UTF-8 ./configure --with-python /usr/bin/python2 --with-netcdf /usr --no-updates gnu
  make install

  # configure and build parallel version of AmberTools
  LANG=en_US.UTF-8 ./configure --with-python /usr/bin/python2 --with-netcdf /usr --no-updates -mpi gnu
  make install

  # if CUDA is installed then build extra binaries
  if [ -d "/opt/cuda" ]; then
      export CUDA_HOME="/opt/cuda"
      export LD_LIBRARY_PATH="/opt/cuda/lib:/opt/cuda/lib64:${LD_LIBRARY_PATH}"

      LANG=en_US.UTF-8 ./configure --with-python /usr/bin/python2 --with-netcdf /usr --no-updates -cuda gnu
      make install

      LANG=en_US.UTF-8 ./configure --with-python /usr/bin/python2 --with-netcdf /usr --no-updates -cuda -mpi gnu
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

  # fix permissions
  chown -R root:4535 ${pkgdir}/opt/${pkgname}
}
