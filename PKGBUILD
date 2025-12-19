# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
_pkgver=0.8.5-alpha2512191358
pkgver=${_pkgver//-/}
_vername=bonsai
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="https://ifcopenshell.org/"
license=('LGPL-3.0-or-later' 'GPL-3.0-or-later')
depends=(
  'boost-libs'
  'hdf5'
  'hicolor-icon-theme'
  'libxml2-legacy'
  'mpfr'
  'opencascade'
  # 'opencollada' # dropped from extra
  'python'
  'python-numpy'
  'python-jinja'
  'python-pytz'
  'python-typing_extensions'
  'python-requests'
  'python-platformdirs'

)
optdepends=(
  'python-xsdata: bonsaï'
  'python-shapely: : bonsaï'
  'python-svgwrite: bonsaï'
  'python-isodate: bonsaï'
  'python-pystache: bonsaï'
  'python-socketio: bonsaï'
  'python-natsort: bonsaï'
  'python-openpyxl: bonsaï'
  'python-odfpy: bonsaï'
  'python-xmlschema: bonsaï, bcf support'
  'python-deepdiff: ifcdiff'
  'python-tzfpy: bonsaï'
  'python-orderly-set: bonsaï'
  'python-gitpython: bonsaï'
  'python-networkx: bonsaï'
  'python-pyradiance: bonsaï'

)

makedepends=(
  'blender'
  'boost'
  'cgal'
  'cmake'
  'eigen'
  'git'
  'ninja'
  'nlohmann-json'
  'python-babel'
  'python-build'
  'python-installer'
  'python-wheel'
  'swig'
  'sz'
)
_patch_url_prefix="https://github.com/sukanka/IfcOpenShell/commit"
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/refs/tags/${_vername}-${_pkgver}.tar.gz"
  "git+https://github.com/svgpp/svgpp.git"
  "git+https://github.com/IfcOpenShell/svgfill.git"
  "bpypolyskel-1.1.3.tar.gz::https://github.com/prochitecture/bpypolyskel/archive/refs/tags/v1.1.3.tar.gz"

  "001-skip-install-python-package-only-install-wrapper.patch::${_patch_url_prefix}/c6657803.patch"
  "002-add-shared-libs.patch::${_patch_url_prefix}/053480f.patch"
  "003-fix-rpath.patch::${_patch_url_prefix}/4523de21.patch"
  "004-fix-boost189.patch::${_patch_url_prefix}/66910ae1.patch"

)
sha256sums=('8ce8f965d346a8eb94a9727541274a0d96ed8ab7c7a329afd3697e244a04c7e1'
  'SKIP'
  'SKIP'
  'c774454e31757796cf02078cc04d4f27b6180d718e1edab4148340879a6b64c5'
  '522021a51b08a944dfed0d72cc0eed8e90db864ab264344d7bafd7627efa773a'
  '41912eafef9d9224e01a204393d1481f84dab6131cce1bfcb731eb691e82487e'
  '664b047d42e063185d2412321eec7bbebd6c2918fe7ec79361cb0aa0c50877c4'
  'd3b4e1abb442fb748b217d753c580969a380a29a92e0a6a557cae77da94793f9')

_iosdir="IfcOpenShell-${_vername}-${_pkgver}"

_apply_patch() {
  cd "${srcdir}/${_iosdir}"
  for p in $srcdir/*.patch; do
    patch -p1 -l <$p
  done

}
prepare() {
  mv bpypolyskel-1.1.3 bpypolyskel
  cp -ar svgpp/* svgfill/3rdparty/svgpp
  cp -ar svgfill/* ${_iosdir}/src/svgfill
  (
    _apply_patch
  )

}
_build_pymodules() {

  pushd "${srcdir}/${_iosdir}"
  find src -name '*.py' -o -name '*.toml' | xargs sed -i "/version =/s/0.0.0/${pkgver//_/-}/g"
  for _dir in src/*; do
    if [ ! -d ${_dir} ]; then
      continue
    fi
    pushd ${_dir}
    if [ -f pyproject.toml ] || [ -f setup.py ]; then
      python -m build --wheel --no-isolation
    fi
    popd
  done
  popd
}
build() {
  _build_pymodules
  install -d build

  local CMAKE_ARGS=(
    -S ${_iosdir}/cmake
    -B build
    -G Ninja
    -DEIGEN_DIR=/usr/include/eigen3
    -DOCC_INCLUDE_DIR=/usr/include/opencascade
    -DOCC_LIBRARY_DIR=/usr/lib
    -DHDF5_INCLUDE_DIR=/usr/include
    -DHDF5_LIBRARY_DIR=/usr/lib
    -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2
    -DLIBXML2_LIBRARIES="/usr/lib/libxml2.so.2"
    -DGMP_INCLUDE_DIR=/usr/include
    -DMPFR_INCLUDE_DIR=/usr/include
    -DJSON_INCLUDE_DIR=/usr/include
    -DSWIG_EXECUTABLE="/usr/bin/swig"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_SHARED_LIBS=ON
    -DGLTF_SUPPORT=ON
    -DCOLLADA_SUPPORT=OFF
  )
  cmake "${CMAKE_ARGS[@]}"

  ninja -C build
}

package() {
  _blender_ver=$(blender --version | grep -Po 'Blender \K[0-9].[0-9]+')
  _python_ver=$(python --version | grep -Po 'Python \K[0-9].[0-9]+')
  cd "${srcdir}/build"
  DESTDIR="$pkgdir" ninja install
  echo "Installed main libs done"

  # Install license file
  cd "${srcdir}/${_iosdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING.LESSER -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install python modules
  find src/*/dist -name '*.whl' -print0 | xargs -0 -I {} python -m installer --destdir="$pkgdir" {}
  echo "Installed python modules done"

  # extra modules that does not build whl
  cp -rf src/{ifc2ca,ifcsverchok} ${pkgdir}/usr/lib/python${_python_ver}/site-packages
  cp -rf "${srcdir}"/build/ifcwrap/{ifcopenshell_wrapper.py,*.so} ${pkgdir}/usr/lib/python${_python_ver}/site-packages/ifcopenshell

  # provides blender extension
  install -d "${pkgdir}/usr/share/blender/${_blender_ver}/extensions/system"
  ln -s /usr/lib/python${_python_ver}/site-packages/${_vername} "${pkgdir}/usr/share/blender/${_blender_ver}/extensions/system/${__vername}"

  # install desktop and wrappers
  cd "${srcdir}/${_iosdir}/src/${_vername}/${_vername}/libs/desktop"
  install -Dm755 ${_vername} -t ${pkgdir}/usr/bin
  install -Dm644 ${_vername}.png -t ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  install -Dm644 ${_vername}.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 ${_vername}.xml -t ${pkgdir}/usr/share/mime/packages/
  install -Dm644 x-ifc_128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/x-ifc.png
  install -Dm644 x-ifc_512x512.png ${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes/x-ifc.png

  # bpypolyskel blender extension
  cp -rf ${srcdir}/bpypolyskel ${pkgdir}/usr/lib/python${_python_ver}/site-packages
  ln -s /usr/lib/python${_python_ver}/site-packages/bpypolyskel "${pkgdir}/usr/share/blender/${_blender_ver}/extensions/system/bpypolyskel"
}
