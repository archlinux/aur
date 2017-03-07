# Maintainer: Michele Mocciola <mickele>

pkgname=salome-med
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - MED Module"
url="http://www.salome-platform.org"
depends=("salome-gui>=${pkgver}" "salome-gui<${pkgver:0:2}$((${pkgver:2:1}+1)).0" "salome-medcoupling>=${pkgver}" "salome-medcoupling<${pkgver:0:2}$((${pkgver:2:1}+1)).0")
makedepends=('doxygen' 'boost' 'swig2' 'python2-sphinx')
arch=('i686' 'x86_64')
license=('LGPL')
source=("${pkgname}.sh" "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")
OPTIONS+=(debug !strip)

_source=MED_SRC
# _source=med
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

  rm -rf "${srcdir}/${_source}/build"
  mkdir "${srcdir}/${_source}/build"
  cd "${srcdir}/${_source}/build"

  local cmake_options=""

  # generic options
  # cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_BUILD_TYPE=Debug"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=ON"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # sphinx-2
  cmake_options+=" -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2"
  cmake_options+=" -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2"

  # swig2
  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"

  # vtk
  cmake_options+=" -DVTK_DIR=${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}"
  
  cmake ${cmake_options} ..

  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir/" install
  
  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${pkgdir}||" ${_FILE}
    sed -i -e "s|${srcdir}||" ${_FILE}
  done
  
  # install profile
  install -D -m755 "${srcdir}/${pkgname}.sh" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  rm -f "${pkgdir}${_installdir}/adm_local/unix/config_files/check_GUI.m4"
}
md5sums=('1757431158da006ae8d853289fbd1b15'
         '0f6de10ad9d9c646fce3ca21a7dab46a')
