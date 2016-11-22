# Maintainer: Michele Mocciola <mickele>

pkgname=salome-gui
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - GUI Module"
url="http://www.salome-platform.org"
depends=("salome-kernel>=${pkgver}" 'salome-kernel<7.9.0' 'qt4' 'python2-pyqt4' 'opencascade>=6.9.0' 'qwt' 'paraview-salome=5.0.1p1' 'sip')
makedepends=('doxygen' 'swig2' 'boost' 'optipng' 'python2-sphinx' 'git')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.profile" "salome.desktop" "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")

_source=GUI_SRC
#_source=gui
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d
_paraviewrootdir=/usr
_paraviewver=5.0

prepare(){
#  msg "Connecting to git server..."
#  if [[ -d ${_source} ]] ; then
#    rm -rf ${_source}
#  fi
#  git clone git://git.salome-platform.org/modules/${_source}.git
#  cd ${_source}
#  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
#  msg "GIT checkout done or server timeout"

  cd "${srcdir}/${_source}"

  # error "/usr/lib/libQtNetwork.so.4: error adding symbols: DSO missing from command line"
  #sed -e "s|QtXml|QtXml QtNetwork|" -i CMakeLists.txt

  # error "sip: Q_PID is undefined"
  sed -e 's|from PyQt4 import pyqtconfig;|from PyQt4 import QtCore;|' \
      -i adm_local/cmake_files/FindPyQt4.cmake
  sed -e "s|pyqtconfig.Configuration().pyqt_sip_flags|QtCore.PYQT_CONFIGURATION['sip_flags']|" \
      -i adm_local/cmake_files/FindPyQt4.cmake

  # pyuic4 -> python2-pyuic4
  sed -e 's|pyuic4|python2-pyuic4|' \
      -i adm_local/cmake_files/FindPyQt4.cmake

  # DESTDIR
  sed -e 's|\\"\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_TS_DIR}\\"|\\"\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_TS_DIR}\\"|' -i adm_local/cmake_files/UseQt4Ext.cmake

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
  for _FILE in `grep -Rl "python -c" * `
  do
	sed -e "s|python -c|python2 -c|" -i ${_FILE}
  done
}

build() {
  source "${_profiledir}/salome-kernel.sh"
  
  rm -rf "${srcdir}/${_source}/build"
  mkdir -p "${srcdir}/${_source}/build"
  cd "${srcdir}/${_source}/build"

  local cmake_options=""

  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  cmake_options+=" -DCMAKE_CXX_STANDARD=98"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # qwt
  cmake_options+=" -DQWT_ROOT_DIR=/usr"

  # opencascade
  cmake_options+=" -DCAS_ROOT_DIR=/opt/opencascade"

  # sip
  cmake_options+=" -DSIP_ROOT_DIR=/usr"

  # VTK
  cmake_options+=" -DVTK_DIR=${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}"

  # paraview
  cmake_options+=" -DPARAVIEW_ROOT_DIR=${_paraviewrootdir}"

  # swig
  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"
  
  # sphinx-2
  cmake_options+=" -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2"
  cmake_options+=" -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2"

  # hdf5-1.8
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"
  
  cmake ${cmake_options} ..

  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir" install

  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${srcdir}||" ${_FILE}
    sed -i -e "s|${pkgdir}||" ${_FILE}
  done

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  # install menu entry
  install -D -m 644 "${srcdir}/${_source}/src/LightApp/resources/icon_applogo.png" "${pkgdir}/usr/share/pixmaps/salome.png"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/salome.desktop"

  for _FILE in /share/salome/resources/gui/gl_view_fitarea.png /share/salome/resources/gui/gl_view_fitselect.png /share/salome/resources/gui/vtk_view_style_switch.png /share/salome/resources/gui/occ_view_clipping_pressed.png /share/salome/resources/gui/occ_view_maximized.png /share/salome/resources/gui/occ_view_minimized.png /share/salome/resources/gui/occ_view_style_switch.png /share/salome/resources/gui/graphics_view_fitarea.png /share/salome/resources/gui/graphics_view_fitselect.png /share/doc/salome/gui/GUI/gl_view_fitarea.png /share/doc/salome/gui/GUI/gl_view_fitselect.png /share/doc/salome/gui/GUI/occ_view_style_switch.png /share/doc/salome/gui/GUI/occ_view_minimized.png /share/doc/salome/gui/GUI/occ_view_maximized.png /share/doc/salome/gui/GUI/objectbrowser1.png /share/doc/salome/gui/GUI/vtk_view_style_switch.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}${_FILE}
  done

  sed -e "s|GEOM,SMESH,HEXABLOCK,MED,YACS,PARAVIS|GEOM,SMESH,HEXABLOCK,MED,YACS,PARAVIS,EFICAS,ASTER|" -i ${pkgdir}${_installdir}/share/salome/resources/gui/SalomeApp.xml

  rm -f "${pkgdir}${_installdir}/bin/salome/VERSION"
  ln -s ${_installdir}/share/salome/resources/gui/SalomeApp.xml ${pkgdir}${_installdir}
  ln -s ${_installdir}/share/salome/resources/gui/LightApp.xml ${pkgdir}${_installdir}
}
md5sums=('73cd7110827ebb24ae6d2fac087fc4e0'
         'a102063b779e332914ef0b73843e928a'
         '0f6de10ad9d9c646fce3ca21a7dab46a')
