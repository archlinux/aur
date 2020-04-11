# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
# Contributor: mickele <mimocciola[at]yahoo[dot]com>
pkgname=ifcopenshell-v0.6.0-git
pkgver=0.6.0b0.r611.g42fedf81
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python')
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig3')
provides=('ifcopenshell' 'IfcBlender' 'IfcConvert' 'IfcGeomServer')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/IfcOpenShell/IfcOpenShell.git#branch=v0.6.0")
_blenderver=2.82

prepare(){
  cd "${srcdir}/IfcOpenShell"
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
  mkdir -p build
  cd "${srcdir}/IfcOpenShell/build"
  local _pythonver=$(python --version >&1)

  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
  -DOCC_INCLUDE_DIR=/usr/include/opencascade \
	-DOCC_LIBRARY_DIR=/usr/lib \
	-DLIBXML2_INCLUDE_DIR=/usr/include/libxml2 \
	-DLIBXML2_LIBRARIES="/usr/lib/libxml2.so.2"  \
	-DSWIG_EXECUTABLE="/usr/bin/swig-3" \
	../cmake/

  make
}

package() {
  cd "${srcdir}/IfcOpenShell/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/IfcOpenShell"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  mkdir -p "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell/src/ifcblender/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell/src/ifcopenshell-python/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc
  cp -f "${srcdir}"/IfcOpenShell/build/ifcwrap/*ifcopenshell_wrapper* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc/ifcopenshell
}

md5sums=('SKIP')
