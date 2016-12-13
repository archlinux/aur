# Maintainer: Michele Mocciola <mickele>
     
pkgname=salome-medcoupling
pkgver=7.8.0
pkgrel=1
pkgdesc="MEDCoupling has been extracted from SALOME MED module and distributed as a separate product. This allows external projects to benefit from direct usage of MEDCoupling library for operating on MED files."
url="http://www.salome-platform.org/downloads/current-version/"
license=('GPLv2')
depends=('cppunit' 'parmetis3' 'scotch' 'med-salome' 'libxml2')
makedepends=('doxygen' 'python2-sphinx' 'swig2')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
source=("${pkgname}.sh" "http://files.salome-platform.org/Salome/other/medCoupling-${pkgver}.tar.gz")

_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d

prepare() {
  cd "${srcdir}"

  if [ -d build ]; then
    rm -rf build
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  
  local python_version=2.7
  local cmake_options=""

  local cmake_options=""

  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  #cmake_options+=" -DMEDCOUPLING_BUILD_DOC:BOOL=OFF"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"
  cmake_options+=" -DMEDCOUPLING_USE_MPI:BOOL=ON"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2"

  # sphinx-2
  cmake_options+=" -DSPHINX_EXECUTABLE:FILEPATH=/usr/bin/sphinx-build2"
  cmake_options+=" -DSPHINX_APIDOC_EXECUTABLE:FILEPATH=/usr/bin/sphinx-apidoc2"

  # swig2
  cmake_options+=" -DSWIG_EXECUTABLE:FILEPATH=/usr/bin/swig-2"

  # libxml2
  cmake_options+=" -DLIBXML2_ROOT_DIR:PATH=/usr"
  cmake_options+=" -DLibXml2_DIR:PATH=/usr/lib/cmake/libxml2"
  cmake_options+=" -DLIBXML2_INCLUDE_DIR:PATH=/usr/include/libxml2"

  # hdf5-1.8
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"

  # parmetis3
  cmake_options+=" -DMEDCOUPLING_PARTITIONER_METIS:BOOL=OFF"
  cmake_options+=" -DMEDCOUPLING_PARTITIONER_PARMETIS:BOOL=ON"
  cmake_options+=" -DPARMETIS_INCLUDE_DIRS:PATH=/usr/include/parmetis-3"
  cmake_options+=" -DPARMETIS_LIBRARIES:FILEPATH=/usr/lib/libparmetis-3.so"
  cmake_options+=" -DPARMETIS_SEQ_LIBRARIES:FILEPATH=/usr/lib/libmetis-4.so"
  

  cmake ${cmake_options} \
  	../medCoupling-${pkgver}

  make
}
 
package() {
  cd "${srcdir}/build"

  make DESTDIR=${pkgdir} install

 
  cd ${pkgdir}
  for _FILE in `grep -Rl "/usr/bin/env python" *`
  do
    sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.sh" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"
}
md5sums=('a4206aab23cf0b0056c8c7c943c81683'
         '45566e99bba154a89673f75651aad5c9')
