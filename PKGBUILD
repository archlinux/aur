# Maintainer: Michele Mocciola <mickele>

pkgname=salome-kernel
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - KERNEL Module"
url="http://www.salome-platform.org"
depends=('python2' 'python2-numpy' 'boost-libs' 'omniorb416' 'omniorbpy36' 'omninotify-omniorb416' 'hdf5' 'graphviz' 'libxml2' 'cppunit' 'lapack' 'net-tools' 'openmpi')
makedepends=('doxygen' 'python2-sphinx' 'git' 'swig2')
arch=('i686' 'x86_64')
license=('LGPL')
source=("salome-kernel.profile"  "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")
options=(!makeflags)
# options=(debug !strip)

_source=KERNEL_SRC
# _source=kernel
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d

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

  sed -e 's|INSTALL(CODE "FILE(TIMESTAMP \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_name}\\"            py_time)")|INSTALL(CODE "IF(EXISTS \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_we}.py\\") \\n  FILE(TIMESTAMP \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_we}.py\\" py_time) \\n ELSE()\\n  SET(py_time 0) \\n ENDIF() ")|' -i salome_adm/cmake_files/SalomeMacros.cmake

  # DESTDIR
  sed -e 's|\\"\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_PYIDL_DIR}\\"|\\"\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_PYIDL_DIR}\\"|' -i salome_adm/cmake_files/UseOmniORB.cmake
  for _FILE in {"salome_adm/cmake_files/SalomeMacros.cmake","salome_adm/cmake_files/deprecated/install_and_compile_python_file.cmake"}
  do
    sed -e "s|'\${CMAKE_INSTALL_PREFIX}|'\\\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}|" -i ${_FILE}
  done

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
  sed -e "s|python|python2|" -i bin/runSalome
  for _FILE in {"bin/appliskel/runSession","bin/appliskel/runAppli","bin/appliskel/runConsole","bin/appliskel/runRemote.sh"}
  do
    sed -e "s|python |python2 |" -i ${_FILE}
  done
}

build() {
  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  # -DCMAKE_CXX_STANDARD=98 \

  cmake .. \
   	-DCMAKE_BUILD_TYPE=Debug \
   	-DCMAKE_VERBOSE_MAKEFILE=On \
	-DSALOME_CMAKE_DEBUG=On \
     	-DCMAKE_INSTALL_PREFIX=${_installdir} \
     	-DSALOME_USE_LIBBATCH=On \
     	-DSALOME_USE_MPI=On \
     	-DMPI_ROOT_DIR=/usr \
     	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
     	-DPTHREAD_ROOT_DIR=/usr \
     	-DBOOST_ROOT_DIR=/usr \
     	-DCPPUNIT_ROOT_DIR=/usr \
     	-DDOXYGEN_ROOT_DIR=/usr \
     	-DGRAPHVIZ_ROOT_DIR=/usr \
     	-DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     	-DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2 \
     	-DOMNIORB_ROOT_DIR=/usr \
     	-DOMNIORBPY_ROOT_DIR=/usr \
     	-DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     	-DLIBXML2_ROOT_DIR=/usr \
     	-DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     	-DLIBXML2_INCLUDE_DIR=/usr/include/libxml2

  # temporary workaround to solve a ug in cmake (bug 50672)
  # see https://bugs.archlinux.org/task/50672
  for _FILE in `grep -Rl " _FORTIFY_SOURCE=2" *`
  do 
    sed -e "s| _FORTIFY_SOURCE=2| -D_FORTIFY_SOURCE=2|" -i ${_FILE}
  done

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
  for _FILE in `find -L ${pkgdir}${_installdir}/bin/salome/test/ -iname "*.cmake"`
  do
    msg ${_FILE}
    sed -i -e "s| python | python2 |" ${_FILE}
  done

  rm -f "${pkgdir}${_installdir}/bin/salome/VERSION"

  for _FILE in {"salome","envd","runConsole","runRemote.sh","runSalomeScript","runSession"}
  do
    ln -s "${_installdir}/bin/salome/appliskel/${_FILE}" "${pkgdir}${_installdir}"
  done

  for _FILE in {"getApplyPath","update_catalogs","kill_remote_containers"}
  do
    ln -s ${_installdir}/bin/salome/appliskel/${_FILE}.py "${pkgdir}${_installdir}"
    ln -s ${_installdir}/bin/salome/appliskel/${_FILE}.pyc "${pkgdir}${_installdir}"
    ln -s ${_installdir}/bin/salome/appliskel/${_FILE}.pyo "${pkgdir}${_installdir}"
  done

  ln -s /tmp "${pkgdir}${_installdir}/USERS"

  # install profile
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"

  # install link to launcher in /usr/bin
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "${_installdir}/salome" "${pkgdir}/usr/bin/salome"
}
md5sums=('caa0cf581852ab625fff04a9f0100f5b'
         '0f6de10ad9d9c646fce3ca21a7dab46a')
