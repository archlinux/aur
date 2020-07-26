# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
# Contributor: mickele <mimocciola[at]yahoo[dot]com>
pkgname=ifcopenshell-git
pkgver=0.6.0b0.r928.g21a46808
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon. GIT version."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python' 'nlohmann-json')
optdepends=('python-svgwrite: blender bim addon svg support'
			'python-occ-core: blender bim addon cut ifc support'
			'python-pystache: blender bim addon'
			'python-numpy: blender bim addon cut ifc support'
			'python-fcl: ifcclash'
			'python-deepdiff: ifcdiff'
			'python-pyparsing: ifcexpressparser support'
			'python-requests: blender bim addon covetool support'
			'python-lark-parser: util, ifccsv, ifcclash support')
makedepends=('cmake' 'boost>=1.58.0' 'swig')
provides=('ifcopenshell' 'blender-plugin-bim' 'IfcConvert' 'IfcGeomServer')
conflicts=('ifcopenshell')
replaces=()
backup=()
source=("git+https://github.com/IfcOpenShell/IfcOpenShell.git")
_blenderver=2.83

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
	-DLIBXML2_LIBRARIES="/usr/lib/libxml2.so.2" \
 	-DJSON_INCLUDE_DIR=/usr/include \
	-DGLTF_SUPPORT=On \
	-DSWIG_EXECUTABLE="/usr/bin/swig" \
	../cmake/
  make
}

package() {
  # Install IfcOpenShell
  cd "${srcdir}/IfcOpenShell/build"
  make DESTDIR="${pkgdir}" install

  # Install license file
  cd "${srcdir}/IfcOpenShell"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install blender bim addon
  mkdir -p "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
  cd "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcblenderexport/blenderbim" "./"
  cd blenderbim/libs/site/packages
  cp -rf "${srcdir}/IfcOpenShell/src/ifcclash/." "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcdiff/." "./"
  python -O -m compileall "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/blenderbim"
  chmod -R a+rwX "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/blenderbim/bim/data"
}

md5sums=('SKIP')
