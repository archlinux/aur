pkgname=ifcopenshell
pkgver=0.6.0a1
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python')
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig')
provides=('ifcopenshell' 'ifcblender' 'IfcConvert' 'IfcGeomServer')
conflicts=()
replaces=()
backup=()
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/v${pkgver//_/-}.tar.gz")
_blenderver=2.79

prepare(){
  cd "${srcdir}/IfcOpenShell-${pkgver//_/-}"

  find src -type f -exec sed -i -e "s|UnicodeString|icu::UnicodeString|g" {} \;
}

build() {
  cd "${srcdir}/IfcOpenShell-${pkgver//_/-}"
  mkdir -p build
  cd "${srcdir}/IfcOpenShell-${pkgver//_/-}/build"
  local _pythonver=$(python --version >&1)
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_STANDARD=11 \
	-DOCC_INCLUDE_DIR=/usr/include/opencascade \
	-DOCC_LIBRARY_DIR=/usr/lib \
	-DOPENCOLLADA_INCLUDE_DIR=/usr/include/opencollada \
	-DOPENCOLLADA_LIBRARY_DIR=/usr/lib/opencollada \
	-DICU_INCLUDE_DIR=/usr/include/unicode \
	-DICU_LIBRARY_DIR=/usr/lib \
        -DPYTHON_INCLUDE_DIR=/usr/include/python${_pythonver:7:3}m \
        -DPYTHON_LIBRARY=/usr/lib64/libpython${_pythonver:7:3}m.so \
	-DSWIG_EXECUTABLE=/usr/bin/swig \
	../cmake
  make
}

package() {
  cd "${srcdir}/IfcOpenShell-${pkgver//_/-}/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/IfcOpenShell-${pkgver//_/-}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  mkdir -p "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell-${pkgver//_/-}/src/ifcblender/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib
  cp -rf "${srcdir}"/IfcOpenShell-${pkgver//_/-}/src/ifcopenshell-python/* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc
  cp -f "${srcdir}"/IfcOpenShell-${pkgver//_/-}/build/ifcwrap/*ifcopenshell_wrapper* "${pkgdir}"/usr/share/blender/${_blenderver}/scripts/addons_contrib/io_import_scene_ifc/ifcopenshell
}

md5sums=('869cd9a4440bda959734a99bc23be633')
