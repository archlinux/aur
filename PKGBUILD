# Maintainer: mickele <mimocciola[at]yahoo[dot]com>
pkgname=python2-ifcopenshell-git
pkgver=0.5.0.preview2.r128.gc7c5e69
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides only wrapper for python2. GIT version."
url="http://ifcopenshell.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('opencascade' 'opencollada' 'boost-libs>=1.58.0' 'python2')
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig')
conflicts=()
replaces=()
backup=()
source=('IfcOpenShell::git://github.com/IfcOpenShell/IfcOpenShell.git')

pkgver() {
  cd IfcOpenShell

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare(){
  cd "${srcdir}/IfcOpenShell"

  for _FILE in `grep -Rl "COMMAND python" *`; do
    sed -e "s|COMMAND python|COMMAND python2|" -i ${_FILE}
  done

  sed -e 's|#include "SvgSerializer.h"|#include "SvgSerializer.h"\n#include <Standard_Version.hxx>|' -i src/ifcconvert/SvgSerializer.cpp
  
  sed -e 's|\t#include "../ifcgeom/IfcGeom.h"|\t// #include "../ifcgeom/IfcGeom.h"|' -i src/ifcwrap/IfcPython.i
  sed -e 's|\t#include "../ifcgeom/IfcGeomIterator.h"|\t#include "../ifcgeom/IfcGeomIterator.h"\n\t#include "../ifcgeom/IfcGeom.h"|' -i src/ifcwrap/IfcPython.i

  sed -e "s|FIND_PACKAGE(Boost REQUIRED COMPONENTS system program_options regex thread date_time)|FIND_PACKAGE(Boost REQUIRED COMPONENTS system program_options regex thread date_time)\nADD_DEFINITIONS(-DBOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)|" -i cmake/CMakeLists.txt

  sed -e "s|boost::shared_ptr<Representation::Triangulation<P>>|boost::shared_ptr<Representation::Triangulation<P> >|" -i src/ifcgeom/IfcGeomElement.h

  sed -e "s|#include <iomanip>|#include <iomanip>\n#include <unicode/unistr.h>|" -i src/ifcparse/IfcCharacterDecoder.cpp
}

build() {
  cd "${srcdir}/IfcOpenShell"

  mkdir -p build
  cd "${srcdir}/IfcOpenShell/build"
  local _pythonver=$(python2 --version 2>&1)
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_STANDARD=11 \
	-DOCC_INCLUDE_DIR=/opt/opencascade/inc \
	-DOCC_LIBRARY_DIR=/opt/opencascade/lib \
	-DOPENCOLLADA_INCLUDE_DIR=/usr/include/opencollada \
	-DOPENCOLLADA_LIBRARY_DIR=/usr/lib/opencollada \
	-DICU_INCLUDE_DIR=/usr/include/unicode \
	-DICU_LIBRARY_DIR=/usr/lib \
        -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python${_pythonver:7:3} \
        -DPYTHON_LIBRARY:FILEPATH=/usr/lib64/libpython${_pythonver:7:3}.so \
	-DSWIG_EXECUTABLE=/usr/bin/swig \
	../cmake
  make
}

package() {
  cd "${srcdir}/IfcOpenShell/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/IfcOpenShell"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # file already provided by ifcopenshell/ifcopenshell-git
  rm -f "${pkgdir}"/usr/lib/libIfc*.a
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
}

md5sums=('SKIP')
