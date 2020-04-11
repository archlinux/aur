pkgname=ifcopenshell-git
pkgver=0.5.0rc0.r17.g8625aab5
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon. GIT version."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python')
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig')
provides=('ifcopenshell' 'IfcBlender' 'IfcConvert' 'IfcGeomServer')
conflicts=('ifcopenshell')
replaces=()
backup=()
source=('IfcOpenShell::git://github.com/IfcOpenShell/IfcOpenShell.git')
_blenderver=2.76

prepare(){
  cd "${srcdir}/IfcOpenShell"

  sed -e 's|#include "SvgSerializer.h"|#include "SvgSerializer.h"\n#include <Standard_Version.hxx>|' -i src/ifcconvert/SvgSerializer.cpp
  
  sed -e 's|\t#include "../ifcgeom/IfcGeom.h"|\t// #include "../ifcgeom/IfcGeom.h"|' -i src/ifcwrap/IfcPython.i
  sed -e 's|\t#include "../ifcgeom/IfcGeomIterator.h"|\t#include "../ifcgeom/IfcGeomIterator.h"\n\t#include "../ifcgeom/IfcGeom.h"|' -i src/ifcwrap/IfcPython.i

  sed -e "s|FIND_PACKAGE(Boost REQUIRED COMPONENTS system program_options regex thread date_time)|FIND_PACKAGE(Boost REQUIRED COMPONENTS system program_options regex thread date_time)\nADD_DEFINITIONS(-DBOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)|" -i cmake/CMakeLists.txt

  sed -e "s|boost::shared_ptr<Representation::Triangulation<P>>|boost::shared_ptr<Representation::Triangulation<P> >|" -i src/ifcgeom/IfcGeomElement.h

  sed -e "s|#include <iomanip>|#include <iomanip>\n#include <unicode/unistr.h>|" -i src/ifcparse/IfcCharacterDecoder.cpp
}

pkgver() {
  cd IfcOpenShell

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd "${srcdir}/IfcOpenShell"
  if [ -d "build" ]; then
    rm -rf build
  fi
  mkdir -p build
  cd build
  local _pythonver=$(python --version >&1)
  #	-DBUILD_IFCPYTHON=OFF \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_STANDARD=11 \
	-DOCC_INCLUDE_DIR=/usr/include/opencascade \
	-DOCC_LIBRARY_DIR=/usr/lib \
	-DOPENCOLLADA_INCLUDE_DIR=/usr/include/opencollada \
	-DOPENCOLLADA_LIBRARY_DIR=/usr/lib/opencollada \
	-DICU_INCLUDE_DIR=/usr/include/unicode \
	-DICU_LIBRARY_DIR=/usr/lib \
  -DPYTHON_INCLUDE_DIR=/usr/include/python${_pythonver:7:3} \
  -DPYTHON_LIBRARY=/usr/lib64/libpython${_pythonver:7:3}.so \
	-DSWIG_EXECUTABLE=/usr/bin/swig \
	../cmake
  make
}

package() {
  cd "${srcdir}/IfcOpenShell/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/IfcOpenShell"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  mkdir -p "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell/src/ifcblender/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell/src/ifcopenshell-python/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc
  cp -f "${srcdir}"/IfcOpenShell/build/ifcwrap/*ifcopenshell_wrapper* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc/ifcopenshell
}

md5sums=('SKIP')
