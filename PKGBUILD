# Maintainer: Michele Mocciola <mickele>

pkgname=salome-geom
pkgver=7.6.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - GEOM Module"
url="http://www.salome-platform.org"
depends=('salome-gui>=7.6.0' 'salome-gui<7.7.0')
makedepends=('boost' 'optipng' 'swig2')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.profile" "doc_salome_gui_GEOM_collect_geom_methods.py.patch")

_source=geom
_installdir=/opt/salome/geom
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

  patch -Np1 -i "${srcdir}/doc_salome_gui_GEOM_collect_geom_methods.py.patch"
  
  # sed -e "s|\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_BINS}|\"\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_BINS}\"|" -i CMakeLists.txt
  # sed -e "s|\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_PYTHON}|\"\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_PYTHON}\"|" -i CMakeLists.txt
  # sed -e "s|\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_PYTHON_SHARED}|\"\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\${SALOME_INSTALL_PYTHON_SHARED}\"|" -i CMakeLists.txt
  # sed -e "s|\${CMAKE_INSTALL_PREFIX}|\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}|" -i CMakeLists.txt

  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh

  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DCAS_ROOT_DIR=/opt/opencascade \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2 \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2
     
  sed -e "s|PYTHONPATH=${_installdir}|PYTHONPATH=\$DESTDIR${_installdir}|" -i doc/salome/gui/GEOM/env_script.sh

  make
}

package() {
  cd "$srcdir/$_source/build"

  make DESTDIR="$pkgdir/" install
  
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"
		   
  for _FILE in share/doc/salome/gui/GEOM/arcsn1.png share/doc/salome/gui/GEOM/arcsn2.png share/doc/salome/gui/GEOM/tree_view_fitarea.png share/doc/salome/gui/GEOM/tree_view_fitselect.png share/doc/salome/gui/GEOM/glue_faces3.png share/doc/salome/gui/GEOM/geomimport_reopen.png share/doc/salome/gui/GEOM/remove_extra_edges1.png share/doc/salome/gui/GEOM/remove_extra_edges2.png share/doc/salome/gui/GEOM/scale_transformsn3.png share/doc/salome/gui/GEOM/scale_transformsn4.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}/${_FILE}
  done
}
md5sums=('dd6f6ea96cb26b594777316451c278ac'
         '28be73960779f51a29eef77ff1bc627d')
