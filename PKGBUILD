# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
# Contributor: mickele <mimocciola[at]yahoo[dot]com>
pkgname=(ifcopenshell-git blender-plugin-bim-git)
pkgver=221213.r0.g05cd11ae1
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon. GIT version."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python' 'nlohmann-json' 'libxml2' 'hdf5' 'libaec' 'sz' 'cgal' 'gmp' 'mpfr')
optdepends=('python-svgwrite: blender bim addon svg support'
      'python-occ-core: blender bim addon cut ifc support'
      'python-pystache: blender bim addon'
      'python-numpy: blender bim addon cut ifc support'
      'python-xmlschema: blender bim addon, bcf support'
      'hpp-fcl: ifcclash'
      'python-deepdiff: ifcdiff'
      'python-pyparsing: ifcexpressparser support'
      'python-requests: blender bim addon covetool support'
      'python-lark-parser: util, ifccsv, ifcclash support'
      'python-odfpy: blender bim addon and ifccobie support'
      'python-behave: python-bimtester'
      'python-isodate: blender bim addon'
      'python-olca-ipc: blender bim addon life cycle analysis support'
      'python-toposort: ifcpatch'
      'python-xsdata: blender bim addon'
      'python-brickschema: brickschema support')
makedepends=('cmake' 'boost>=1.58.0' 'swig' 'python-babel')
provides=('ifcopenshell' 'blender-plugin-bim' 'IfcConvert' 'IfcGeomServer' 'python-ifcpatch' 'python-ifcdiff' 'python-bcf' 'python-bimtester' 'python-ifccsv')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/IfcOpenShell/IfcOpenShell.git"
        "git+https://github.com/IfcOpenShell/svgfill.git"
        "git+https://github.com/svgpp/svgpp.git"
        "https://github.com/BrickSchema/Brick/releases/download/nightly/Brick.ttl")
_blender_ver=$(blender --version | grep -Po 'Blender \K[0-9].[0-9]+')
_python_ver=$(python --version | grep -Po 'Python \K[0-9].[0-9]+')

prepare() {
  cd "${srcdir}/IfcOpenShell"
  git submodule init
  git config submodule.svgfill.url "${srcdir}/IfcOpenShell/src/svgfill"
  git submodule update
  cd "${srcdir}/IfcOpenShell/src/svgfill/"
  git submodule init
  git config submodule.svgpp.url "${srcdir}/IfcOpenShell/src/svgfill/3rdparty/svgpp/"
  git submodule update
  sed -i 's/lib_ext a/lib_ext so/' ${srcdir}/IfcOpenShell/cmake/CMakeLists.txt
  cp "${srcdir}/Brick.ttl" "${srcdir}/IfcOpenShell/src/blenderbim/blenderbim/bim/schema"
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

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOCC_INCLUDE_DIR=/usr/include/opencascade \
    -DOCC_LIBRARY_DIR=/usr/lib \
    -DHDF5_INCLUDE_DIR=/usr/include \
    -DHDF5_LIBRARIES="/usr/lib/libhdf5_cpp.so;/usr/lib/libhdf5.so;/usr/lib/libSZ.so;/usr/lib/libaec.so;" \
    -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2 \
    -DLIBXML2_LIBRARIES="/usr/lib/libxml2.so.2" \
    -DGMP_INCLUDE_DIR=/usr/include \
    -DMPFR_INCLUDE_DIR=/usr/include \
    -DGMP_LIBRARY_DIR=/usr/lib \
    -DMPFR_LIBRARY_DIR=/usr/lib \
    -DJSON_INCLUDE_DIR=/usr/include \
    -DGLTF_SUPPORT=ON \
    -DSWIG_EXECUTABLE="/usr/bin/swig" \
    ../cmake/
  make -j4
}

package_ifcopenshell-git() {
  # Install IfcOpenShell
  cd "${srcdir}/IfcOpenShell/build"
  make DESTDIR="${pkgdir}" install

  # Install license file
  cd "${srcdir}/IfcOpenShell"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install python modules
  cd "${pkgdir}/usr/lib/python${_python_ver}/site-packages/"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcclash/." "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcdiff/." "./"
  cp -rf "${srcdir}/IfcOpenShell/src/bcf/src/bcf" "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifccsv" "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcbimtester/bimtester" "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifcpatch" "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifc4d/ifc4d" "./"
  cp -rf "${srcdir}/IfcOpenShell/src/ifc5d/ifc5d" "./"
  pybabel compile -d "./bimtester/locale"
  python -O -m compileall "./"
}

package_blender-plugin-bim-git() {
  # Install blender bim addon
  mkdir -p "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons"
  cd "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons"
  cp -rf "${srcdir}/IfcOpenShell/src/blenderbim/blenderbim" "./"
  python -O -m compileall "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/blenderbim"
  chmod -R a+rwX "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/blenderbim/bim/data"
}

md5sums=('SKIP' 'SKIP' 'SKIP' '5a2d3512fb67f54afa695498f192f131')
