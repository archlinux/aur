# Maintainer: Michele Mocciola <mickele>

pkgname=salome-geom
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - GEOM Module"
url="http://www.salome-platform.org"
depends=("salome-gui>=${pkgver}" "salome-gui<${pkgver:0:2}$((${pkgver:2:1}+1)).0")
makedepends=('boost' 'optipng' 'swig2')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=("${pkgname}.sh" "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")

# _source=geom
_source=GEOM_SRC
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

  cd ${_source}

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

  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  cmake_options+=" -DSALOME_BUILD_DOC:BOOL=ON"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # swig2
  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"

  # vtk
  cmake_options+=" -DVTK_DIR=${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}"

  # libxml2
  cmake_options+=" -DLIBXML2_ROOT_DIR=/usr"
  cmake_options+=" -DLibXml2_DIR=/usr/lib/cmake/libxml2"
  cmake_options+=" -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2"

  # hdf5-1.8
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_INCLUDE_DIR:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"
  
  cmake ${cmake_options} ..
    
  sed -e "s|PYTHONPATH=${_installdir}|PYTHONPATH=\$\{DESTDIR\}${_installdir}|" -i doc/salome/gui/GEOM/env_script.sh

  make
}

package() {
  source ${_profiledir}/salome-kernel.sh
  source ${_profiledir}/salome-gui.sh

  cd "$srcdir/$_source/build"

  make DESTDIR="${pkgdir}" install
  
  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${srcdir}||" ${_FILE}
    sed -i -e "s|${pkgdir}||" ${_FILE}
  done
  
  cd ${pkgdir}

  for _FILE in share/doc/salome/gui/GEOM/arcsn1.png share/doc/salome/gui/GEOM/arcsn2.png share/doc/salome/gui/GEOM/tree_view_fitarea.png share/doc/salome/gui/GEOM/tree_view_fitselect.png share/doc/salome/gui/GEOM/glue_faces3.png share/doc/salome/gui/GEOM/geomimport_reopen.png share/doc/salome/gui/GEOM/remove_extra_edges1.png share/doc/salome/gui/GEOM/remove_extra_edges2.png share/doc/salome/gui/GEOM/scale_transformsn3.png share/doc/salome/gui/GEOM/scale_transformsn4.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}/${_FILE}
  done
  
  # install profile
  install -D -m755 "${srcdir}/${pkgname}.sh" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  rm -f "${pkgdir}${_installdir}/bin/salome/VERSION"
  rm -f "${pkgdir}${_installdir}/bin/salome/test/CTestTestfile.cmake"
}
md5sums=('382b16d3b8cddd67833d8ee2b0b04869'
         '0f6de10ad9d9c646fce3ca21a7dab46a')
