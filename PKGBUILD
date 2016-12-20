# Maintainer: Michele Mocciola <mickele>

pkgname=salome-netgenplugin
pkgver=7.8.0
_netgenver=4.9.13
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - NETGEN plugin"
url="http://www.salome-platform.org"
depends=("salome-smesh>=${pkgver}" "salome-smesh<${pkgver:0:2}$((${pkgver:2:1}+1)).0")
arch=('i686' 'x86_64')
license=('LGPL')
source=("http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz" "http://downloads.sourceforge.net/netgen-mesher/netgen-${_netgenver}.tar.gz" "netgen-4.9.13-for-SALOME.patch" "netgen-4.9.13-for-CMake.patch" "${pkgname}.sh")
options=()

# _source=netgenplugin
_source=NETGENPLUGIN_SRC
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d
_paraviewrootdir=/usr
_paraviewver=5.0

prepare(){
  cd "${srcdir}/netgen-${_netgenver}"
  patch -Np1 -i "${srcdir}/netgen-4.9.13-for-SALOME.patch"
  patch -Np1 -i "${srcdir}/netgen-4.9.13-for-CMake.patch"
  chmod u+x ./build_cmake
  sed -e "s|python|python2|" -i ./build_cmake
  sed -e "s|-avoid-version||" -i nglib/Makefile.am
  sed -e "s|-avoid-version||" -i nglib/Makefile.in

#  cd "${srcdir}"
#  msg "Connecting to git server..."
#  if [[ -d ${_source} ]] ; then
#     rm -rf ${_source}
#  fi
#  git clone git://git.salome-platform.org/plugins/${_source}.git
#  cd ${_source}
#  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
#  msg "GIT checkout done or server timeout"

  cd ${srcdir}/${_source}

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
  for _FILE in `grep -Rl "'python'" * `
  do
    sed -e "s|'python'|'python2'|" -i ${_FILE}
  done
  for _FILE in `grep -Rl '"python"' * `
  do
    sed -e 's|"python"|"python2"|' -i ${_FILE}
  done
  for _FILE in `grep -Rl '"python ' * `
  do
    sed -e 's|"python |"python2 |' -i ${_FILE}
  done
}

build() {
  cd "netgen-${_netgenver}"
  ./build_cmake ./
  cmake -DCMAKE_INSTALL_PREFIX=${_installdir} \
        -DCASROOT=/opt/opencascade
  make
  # temporary install of netgen
  make DESTDIR="${srcdir}" install

  rm -rf "${srcdir}/${_source}/build"
  mkdir -p "${srcdir}/${_source}/build"
  cd "${srcdir}/${_source}/build"
  source ${_profiledir}/salome-kernel.sh
  source ${_profiledir}/salome-gui.sh
  source ${_profiledir}/salome-geom.sh
  source ${_profiledir}/salome-smesh.sh

  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  cmake_options+=" -DCMAKE_CXX_STANDARD=98"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"

  # VTK
  cmake_options+=" -DVTK_DIR=${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}"

  # swig
  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"

  # link to local copy og netgen
  cmake_options+=" -DNETGEN_ROOT_DIR=${srcdir}${_installdir}"

  cmake ${cmake_options} ..

  make
}

package() {
  cd "${srcdir}/netgen-${_netgenver}"
  
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/netgen-${_netgenver}/doc/ng4.pdf" \
                   "${pkgdir}/${_installdir}/doc/netgen/ng4.pdf"

  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir" install

  for _FILE in `find -L ${pkgdir}${_installdir} -iname *.py`
  do
    sed -i -e "s|${srcdir}||" ${_FILE}
    sed -i -e "s|${pkgdir}||" ${_FILE}
  done

  for _FILE in /share/salome/resources/netgenplugin/mesh_tree_algo_netgen_2d.png /share/salome/resources/netgenplugin/mesh_tree_hypo_netgen.png /share/salome/resources/netgenplugin/mesh_tree_hypo_netgen_2d.png /share/salome/resources/netgenplugin/mesh_tree_algo_netgen_2d3d.png
  do
    optipng -quiet -force -fix ${pkgdir}${_installdir}${_FILE}
  done

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.sh" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  # remove conflicting file
  rm -f ${pkgdir}${_installdir}/bin/salome/VERSION
}
md5sums=('0f6de10ad9d9c646fce3ca21a7dab46a'
         '2d56642ca673106837bcd08ff9913d57'
         'b19f13b42651b992359eaf0ad4ae346b'
         '4ae279ab4558b1719fe1d8d65a1ed1a1'
         '9fedc7465dc5853a24b07482c9bc166b')
