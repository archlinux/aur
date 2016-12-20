# Maintainer: Michele Mocciola <mickele>

pkgname=salome-paravis
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - PARAVIS Module"
url="http://www.salome-platform.org"
depends=("salome-smesh>=${pkgver}" "salome-smesh<${pkgver:0:2}$((${pkgver:2:1}+1)).0")
makedepends=('boost' 'python2-sphinx')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.sh" "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")

#_source=paravis
_source=PARAVIS_SRC
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d
_paraviewrootdir=/usr
_paraviewver=5.0

prepare() {
#  msg "Connecting to git server..."
#  if [[ -d ${_source} ]] ; then
#     rm -rf ${_source}
#  fi
#  git clone git://git.salome-platform.org/modules/${_source}.git
#  cd ${_source}
#  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
#  msg "GIT checkout done or server timeout"

  cd ${_source}

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /opt/salome/env.d/salome-kernel.sh
  source /opt/salome/env.d/salome-gui.sh
  source /opt/salome/env.d/salome-medcoupling.sh
  source /opt/salome/env.d/salome-med.sh
  source /opt/salome/env.d/salome-geom.sh
  source /opt/salome/env.d/salome-smesh.sh  

  cd "${srcdir}/${_source}"
  rm -rf build
  mkdir -p build
  cd build
  
  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  cmake_options+=" -DSALOME_BUILD_DOC:BOOL=ON"
  cmake_options+=" -DMEDReader_BUILD_PARALLEL:BOOL=ON"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # sphinx-2
  cmake_options+=" -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2"
  cmake_options+=" -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2"

  # vtk
  cmake_options+=" -DVTK_DIR=${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}"

  # hdf5-1.8
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_INCLUDE_DIR:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"

  # paraview
  cmake_options+=" -DPARAVIEW_ROOT_DIR=/usr"
  
  cmake ${cmake_options} ..
  
  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="${pkgdir}" install

  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${srcdir}||" ${_FILE}
    sed -i -e "s|${pkgdir}||" ${_FILE}
  done

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.sh" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  rm "${pkgdir}${_installdir}/bin/salome/test/CTestTestfile.cmake"
  rm -f "${pkgdir}${_installdir}/bin/salome/VERSION"
}
md5sums=('fb94d18a6614cdb6f4b10af3866ef122'
         '0f6de10ad9d9c646fce3ca21a7dab46a')
