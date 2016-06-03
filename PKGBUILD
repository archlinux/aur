# Maintainer: Michele Mocciola <mickele>

pkgname=salome-yacs
pkgver=7.6.0
pkgrel=2
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - YACS Module"
url="http://www.salome-platform.org"
depends=('salome-gui>=7.6.0' 'salome-gui<7.7.0' 'graphviz' 'qscintilla')
makedepends=('doxygen' 'swig2' 'python2-sphinx')
arch=('i686' 'x86_64')
license=('LGPL')
source=("${pkgname}.profile")

_source=yacs
_basedir=/opt/salome
_installdir=${_basedir}
_profiledir=${_basedir}/env.d
_paraviewrootdir=/usr
_paraviewver=4.2

prepare() {
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}

  msg "GIT checkout done or server timeout"

  for _FILE in {"src/runtime/Test/CMakeLists.txt","src/yacsloader/pmml/CMakeLists.txt","src/yacsloader/Test/CMakeLists.txt"}
  do
    sed -e "s|\${CPPUNIT_INCLUDE_DIRS}|\${CPPUNIT_INCLUDE_DIRS}\n  \${LIBXML2_INCLUDE_DIR}|" -i ${_FILE}
  done

  sed -e "s|\${PYTHON_INCLUDE_DIR}|\${PYTHON_INCLUDE_DIR}\n  \${LIBXML2_INCLUDE_DIR}|" -i src/yacsloader/CMakeLists.txt
  sed -e "s|\${PYTHON_INCLUDE_DIRS}|\${PYTHON_INCLUDE_DIRS}\n  \${LIBXML2_INCLUDE_DIR}|" -i src/yacsloader_swig/CMakeLists.txt

  # python -> python2
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
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2 \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2

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

  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}${_profiledir}/${pkgname}.sh"
}
md5sums=('14aad749fd8d2b694d0edec9a63a90d2')
