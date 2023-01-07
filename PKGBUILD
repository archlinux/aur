# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
pkgver=0.7.0a6
pkgrel=2
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL3')
depends=('boost-libs>=1.58.0' 'opencascade' 'icu' 'opencollada' 'python')
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
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/v${pkgver//_/-}.tar.gz"
        "git+https://github.com/IfcOpenShell/svgfill.git"
        "git+https://github.com/svgpp/svgpp.git"
        "https://github.com/BrickSchema/Brick/releases/download/v1.3.0/Brick.ttl")
_blender_ver=$(blender --version | grep -Po 'Blender \K[0-9].[0-9]+')
_python_ver=$(python --version | grep -Po 'Python \K[0-9].[0-9]+')
_iosdir="IfcOpenShell-${pkgver//_/-}"

prepare() {
  cd "${srcdir}/${_iosdir}/src"
  rm -r "svgfill"
  ln -s "../../svgfill"
  rm -r "svgfill/3rdparty/svgpp"
  ln -s "../../svgpp" "svgfill/3rdparty"
  sed -i 's/lib_ext a/lib_ext so/' ${srcdir}/${_iosdir}/cmake/CMakeLists.txt
  cp "${srcdir}/Brick.ttl" "${srcdir}/${_iosdir}/src/blenderbim/blenderbim/bim/schema"
}

build() {
  cd "${srcdir}/${_iosdir}"
  mkdir -p build
  cd "${srcdir}/${_iosdir}/build"

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

package_ifcopenshell() {
  # Install IfcOpenShell
  cd "${srcdir}/${_iosdir}/build"
  make DESTDIR="${pkgdir}" install

  # Install license file
  cd "${srcdir}/${_iosdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install python modules
  cd "${pkgdir}/usr/lib/python${_python_ver}/site-packages/"
  cp -rf "${srcdir}/${_iosdir}/src/ifcclash/." "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifcdiff/." "./"
  cp -rf "${srcdir}/${_iosdir}/src/bcf/src/bcf" "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifccsv" "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifcbimtester/bimtester" "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifcpatch" "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifc4d/ifc4d" "./"
  cp -rf "${srcdir}/${_iosdir}/src/ifc5d/ifc5d" "./"
  pybabel compile -d "./bimtester/locale"
  python -O -m compileall "./"
}

package_blender-plugin-bim() {
  # Install blender bim addon
  mkdir -p "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons"
  cd "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons"
  cp -rf "${srcdir}/${_iosdir}/src/blenderbim/blenderbim" "./"
  python -O -m compileall "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/blenderbim"
  chmod -R a+rwX "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/blenderbim/bim/data"
}

md5sums=('0814f545b57a5f4de0211151de99fcc7' 'SKIP' 'SKIP' '8a1fabbe039bda399ff9cb0f646fca89')
