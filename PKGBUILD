# Maintainer: Michele Mocciola <mickele>

pkgname=salome-geom
pkgver=7.6.0
pkgrel=2
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - GEOM Module"
url="http://www.salome-platform.org"
depends=('salome-gui>=7.6.0' 'salome-gui<7.7.0')
makedepends=('boost' 'optipng' 'swig2')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.profile" "collect_geom_methods.py.patch" "occ691.patch")

_source=geom
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d
_paraviewrootdir=/usr
_paraviewver=4.2

prepare(){
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
    rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}

  msg "GIT checkout done or server timeout"

  patch -Np1 -i "${srcdir}/collect_geom_methods.py.patch"
  patch -Np1 -i "${srcdir}/occ691.patch"
  
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source ${_profiledir}/salome-kernel.sh
  source ${_profiledir}/salome-gui.sh

  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DCMAKE_CXX_STANDARD=98 \
     -DHDF5_ROOT_DIR=/opt/hdf5-1.8 \
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

  make DESTDIR="${pkgdir}" install
  
  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${srcdir}||" ${_FILE}
    sed -i -e "s|${pkgdir}||" ${_FILE}
  done
  
  # install profile
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  for _FILE in share/doc/salome/gui/GEOM/arcsn1.png share/doc/salome/gui/GEOM/arcsn2.png share/doc/salome/gui/GEOM/tree_view_fitarea.png share/doc/salome/gui/GEOM/tree_view_fitselect.png share/doc/salome/gui/GEOM/glue_faces3.png share/doc/salome/gui/GEOM/geomimport_reopen.png share/doc/salome/gui/GEOM/remove_extra_edges1.png share/doc/salome/gui/GEOM/remove_extra_edges2.png share/doc/salome/gui/GEOM/scale_transformsn3.png share/doc/salome/gui/GEOM/scale_transformsn4.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}/${_FILE}
  done
  
  rm -f "${pkgdir}${_installdir}/bin/salome/VERSION"
  rm -f "${pkgdir}${_installdir}/bin/salome/test/CTestTestfile.cmake"
}
md5sums=('36770c8d0934730e43028db4e71ecbfc'
         '28be73960779f51a29eef77ff1bc627d'
         '729df17954b7542912bcc9c2b572d3b5')
