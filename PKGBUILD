# Maintainer: Michele Mocciola <mickele>

pkgname=salome-kernel
pkgver=7.6.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - KERNEL Module"
url="http://www.salome-platform.org"
depends=('python2' 'python2-numpy' 'boost-libs' 'omniorb416' 'omniorbpy36' 'omninotify-omniorb416' 'hdf5' 'graphviz' 'libxml2' 'cppunit' 'lapack')
makedepends=('doxygen' 'python2-sphinx' 'git' 'swig2')
arch=('i686' 'x86_64')
license=('LGPL')
source=(salome-kernel.profile)

# "http://files.salome-platform.org/Salome/Salome${pkgver}/src${pkgver}.tar.gz"
#_source=KERNEL_SRC_${pkgver}

_source=kernel
_installdir=/opt/salome/kernel

prepare() {
  msg "Connecting to git server..."
  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi
  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
  msg "GIT checkout done or server timeout"

  sed -e 's|INSTALL(CODE "FILE(TIMESTAMP \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_name}\\"            py_time)")|INSTALL(CODE "IF(EXISTS \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_we}.py\\") \\n  FILE(TIMESTAMP \\"\${CMAKE_INSTALL_PREFIX}/\${path}/\${file_we}.py\\" py_time) \\n ELSE()\\n  SET(py_time 0) \\n ENDIF() ")|' -i salome_adm/cmake_files/SalomeMacros.cmake

  # DESTDIR
  sed -e 's|\\"\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_PYIDL_DIR}\\"|\\"\\\$ENV{DESTDIR}\${CMAKE_INSTALL_PREFIX}/\\\${INSTALL_PYIDL_DIR}\\"|' -i salome_adm/cmake_files/UseOmniORB.cmake
  for _FILE in {"salome_adm/cmake_files/SalomeMacros.cmake","salome_adm/cmake_files/InstallAndCompilePythonFile.cmake"}
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

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DPTHREAD_ROOT_DIR=/usr \
     -DBOOST_ROOT_DIR=/usr \
     -DCPPUNIT_ROOT_DIR=/usr \
     -DDOXYGEN_ROOT_DIR=/usr \
     -DGRAPHVIZ_ROOT_DIR=/usr \
     -DSPHINX_ROOT_DIR=/usr \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DOMNIORB_ROOT_DIR=/usr \
     -DOMNIORBPY_ROOT_DIR=/usr \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2

  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir/$pkgname.profile" \
                   "$pkgdir/etc/salome/profile.d/$pkgname.sh"
}
md5sums=('0190508dd75e07f6b8f6230660477c11')
