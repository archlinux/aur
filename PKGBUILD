# Maintainer: Michele Mocciola <mickele>

pkgname=salome-kernel
pkgver=7.8.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - KERNEL Module"
url="http://www.salome-platform.org"
depends=('python2' 'python2-numpy' 'boost-libs' 'omniorb416' 'omniorbpy36' 'hdf5_18' 'graphviz' 'libxml2' 'cppunit' 'lapack' 'net-tools' 'openmpi' 'libbatch')
makedepends=('doxygen' 'python2-sphinx' 'swig2' 'boost')
arch=('i686' 'x86_64')
license=('LGPL')
source=("${pkgname}.profile" "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz")
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

  local cmake_options=""

  # generic options
  cmake_options+=" -DCMAKE_BUILD_TYPE=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"

  # debug options
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"
  cmake_options+=" -DSALOME_CMAKE_DEBUG:BOOL=OFF"

  # libbatch
  cmake_options+=" -DSALOME_USE_LIBBATCH:BOOL=ON"

  # mpi
  cmake_options+=" -DSALOME_USE_MPI:BOOL=ON"
  cmake_options+=" -DMPI_ROOT_DIR=/usr"

  # python2
  cmake_options+=" -DPYTHON_EXECUTABLE=/usr/bin/python2"

  # sphinx-2
  cmake_options+=" -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2"
  cmake_options+=" -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2"

  # omniorb
  cmake_options+=" -DOMNIORB_ROOT_DIR=/usr"
  cmake_options+=" -DOMNIORBPY_ROOT_DIR=/usr"

  # swig2
  cmake_options+=" -DSWIG_EXECUTABLE=/usr/bin/swig-2"

  # libxml2
  cmake_options+=" -DLIBXML2_ROOT_DIR=/usr"
  cmake_options+=" -DLibXml2_DIR=/usr/lib/cmake/libxml2"
  cmake_options+=" -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2"

  # hdf5-1.8
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"

  # options for other system libraries
  cmake_options+=" -DPTHREAD_ROOT_DIR=/usr"
  cmake_options+=" -DBOOST_ROOT_DIR=/usr"
  cmake_options+=" -DCPPUNIT_ROOT_DIR=/usr"
  cmake_options+=" -DDOXYGEN_ROOT_DIR=/usr"
  cmake_options+=" -DGRAPHVIZ_ROOT_DIR=/usr"

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
