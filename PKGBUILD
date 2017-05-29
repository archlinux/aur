# Maintainer: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Philippe Miron <tuxication@gmail.com>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Modified by: Martin Ortbauer <mortbauer@gmail.com>
     
pkgname=med-salome
_pkgname=med
pkgver=3.2.1
pkgrel=1
pkgdesc="MED stands for Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - This version is built to be linked against salome-med on x86_64"
url="http://www.code-aster.org/outils/med/"
license=('LGPL')
depends=('hdf5-salome' 'python2')
makedepends=('gcc-fortran' 'coreutils' 'swig2')
optdepends=('tk')
provides=("med={pkgver}")
conflicts=("med_fichier" "med")
replaces=("med_fichier" "med")
backup=()
arch=('i686' 'x86_64')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz")
	
md5sums=('4965899bb578229ba27c9bc5293c651e')

_basesrcdir=${_pkgname}-${pkgver}_SRC
# _installdir=/opt/${pkgname}
_installdir=/usr
_sharedir=${_installdir}/share/${pkgname}

prepare() {
  cd "${srcdir}"

#  uncomment if using cmake
#  if [ -d build ]; then
#    rm -rf build
#  fi

  cd ${srcdir}/${_basesrcdir}

#  uncomment if using cmake
#  sed -e "s|\${CMAKE_INSTALL_PREFIX}/\${PYFILELOC}/\${inputname}|\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\${PYFILELOC}/\${inputname}|" \
#      -i config/cmake_files/medMacros.cmake

#  comment if using cmake
  sed -e "s|\$hdf5home/include|\$hdf5home/include/hdf5_18|" -i configure
  sed -e "s|\$hdf5home/lib|\$hdf5home/lib/hdf5_18|" -i configure
}

build() {
  export FFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
  export FCFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
  export PYTHON="$(which python2)"
  
# comment to compile mpi version (you need mpi version of hdf5)
  export CC="$(which gcc)"
  export CXX="$(which g++)"
  export FC="$(which gfortran)"
  export F77="$(which gfortran)"

# uncomment to compile mpi version (you need mpi version of hdf5)
#  export MPICC="$(which mpicc)"
#  export MPICXX="$(which mpic++)"
#  export MPIFC="$(which mpif90)"
#  export MPIF77="$(which mpif77)"
#  export CC=$MPICC
#  export CXX=$MPICXX
#  export FC=$MPIFC
#  export F77=$MPIF77

#  comment if using cmake
  cd ${srcdir}/${_basesrcdir}
  ./configure --prefix=${_installdir} --with-med_int=int --datadir=${_sharedir} --with-swig=yes --with-hdf5=/usr

#  uncomment if using cmake
#  mkdir "${srcdir}/build"
#  cd "${srcdir}/build"
#  local python_version=2.7
#  local cmake_options=""
#  cmake_options+=" -DCMAKE_INSTALL_PREFIX=/usr"
#  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
#  cmake_options+=" -DMEDFILE_BUILD_SHARED_LIBS=ON"
#  cmake_options+=" -DMEDFILE_BUILD_STATIC_LIBS=OFF"
#  cmake_options+=" -DMEDFILE_BUILD_TESTS=OFF"
#  cmake_options+=" -DMEDFILE_INSTALL_DOC=ON"
#  cmake_options+=" -DMEDFILE_BUILD_PYTHON=ON"
#  cmake_options+=" -DPYTHON_INCLUDE_DIR=/usr/include/python${python_version}"
#  cmake_options+=" -DPYTHON_LIBRARY=/usr/lib/python${python_version}/config/libpython${python_version}.so"
#  # hdf5-1.8
#  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
#  cmake_options+=" -DHDF5_LIBRARY_DIRS:PATH=/usr/lib/hdf5_18/"
#  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
#  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
#  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"
#  # swig2
#  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"
#  cmake ${cmake_options} \
#  ../${_pkgname}-${pkgver}

  make
}
 
package() {
#  uncomment if using cmake
#  cd "${srcdir}/build"

#  comment if using cmake
  cd ${srcdir}/${_basesrcdir}

  make DESTDIR=${pkgdir} install
}
