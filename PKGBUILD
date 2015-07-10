# Maintainer: Michele Mocciola <mickele>

pkgname=salome-gui
pkgver=7.6.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - GUI Module"
url="http://www.salome-platform.org"
depends=('salome-kernel>=7.6.0' 'salome-kernel<7.7.0' 'qt4' 'python2-pyqt4' 'opencascade>=6.9.0' 'qwt' 'paraview-salome=4.3.1' 'sip')
makedepends=('doxygen' 'swig2' 'boost' 'optipng' 'python2-sphinx' 'git')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.profile" "salome.desktop" "salome")

_source=gui
_installdir=/opt/salome/gui
_paraviewrootdir=/usr
_paraviewver=4.3

prepare(){
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
    rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}

  msg "GIT checkout done or server timeout"

  # error "/usr/lib/libQtNetwork.so.4: error adding symbols: DSO missing from command line"
  sed -e "s|QtXml|QtXml QtNetwork|" -i CMakeLists.txt

  # error "sip: Q_PID is undefined"
  sed -e 's|from PyQt4 import pyqtconfig;|from PyQt4 import QtCore;|' \
      -i adm_local/cmake_files/FindPyQt4.cmake
  sed -e "s|pyqtconfig.Configuration().pyqt_sip_flags|QtCore.PYQT_CONFIGURATION['sip_flags']|" \
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

  # pyuic4 -> python2-pyuic4
  sed -e 's|pyuic4|python2-pyuic4|' \
      -i adm_local/cmake_files/FindPyQt4.cmake
      
  # now "-py2" is default for pyrcc4
  #  sed -e 's|${PYQT_PYRCC_EXECUTABLE}|${PYQT_PYRCC_EXECUTABLE}" -py2"|' \
  #      -i adm_local/cmake_files/FindPyQt4.cmake
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh

  cd "$srcdir/$_source"

  cmake . \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DOPENGL_ROOT_DIR=/usr \
     -DQWT_ROOT_DIR=/usr \
     -DCAS_ROOT_DIR=/opt/opencascade \
     -DSIP_ROOT_DIR=/usr \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DPARAVIEW_ROOT_DIR="${_paraviewrootdir}" \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2

  make
}

package() {
  cd "${srcdir}/${_source}"

  make DESTDIR="$pkgdir" install

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"

  # install menu entry
  install -D -m 644 "${srcdir}/${_source}/src/LightApp/resources/icon_applogo.png" "${pkgdir}/usr/share/pixmaps/salome.png"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/salome.desktop"

  for _FILE in /share/salome/resources/gui/gl_view_fitarea.png /share/salome/resources/gui/gl_view_fitselect.png /share/salome/resources/gui/vtk_view_style_switch.png /share/salome/resources/gui/occ_view_clipping_pressed.png /share/salome/resources/gui/occ_view_maximized.png /share/salome/resources/gui/occ_view_minimized.png /share/salome/resources/gui/occ_view_style_switch.png /share/salome/resources/gui/graphics_view_fitarea.png /share/salome/resources/gui/graphics_view_fitselect.png /share/doc/salome/gui/GUI/gl_view_fitarea.png /share/doc/salome/gui/GUI/gl_view_fitselect.png /share/doc/salome/gui/GUI/occ_view_style_switch.png /share/doc/salome/gui/GUI/occ_view_minimized.png /share/doc/salome/gui/GUI/occ_view_maximized.png /share/doc/salome/gui/GUI/objectbrowser1.png /share/doc/salome/gui/GUI/vtk_view_style_switch.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}${_FILE}
  done

  install -D -m755 "${srcdir}/salome" \
                   "${pkgdir}/usr/bin/salome"

  sed -e "s|GEOM,SMESH,HEXABLOCK,MED,YACS,PARAVIS|GEOM,SMESH,HEXABLOCK,MED,YACS,PARAVIS,EFICAS,ASTER|" -i ${pkgdir}${_installdir}/share/salome/resources/gui/SalomeApp.xml
}
md5sums=('9ee448ab4c97667a75a96450dc8e118a'
         'a102063b779e332914ef0b73843e928a'
         'c47b2bb9e51120089bd3169c2298abf3')
