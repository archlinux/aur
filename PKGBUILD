# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
_pkgver=0.8.5-alpha2601161257
pkgver=${_pkgver//-/_}
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

  "001-skip-install-python-wrapper.patch::${_patch_url_prefix}/131886eba8.patch"
  "002-add-shared-libs.patch::${_patch_url_prefix}/3ef4a0c7ee3.patch"
  "003-fix-rpath.patch::${_patch_url_prefix}/6829c886.patch"
  "004-fix-boost189.patch::${_patch_url_prefix}/3d798653c1add80a69ce3df066bb3379ac4c46a4.patch"
  "005-fix-ifcsverchok-setup.patch::${_patch_url_prefix}/a1063ca1882cc5c82837c008612ccc526dcb2d75.patch"
  "006-use-spdx-license.patch::${_patch_url_prefix}/45d2002a4528f6d277bec5b33500306324e8aac3.patch"
  "007-fix-ld-eror.patch::${_patch_url_prefix}/b1f338eb552a15cb2182ff0c57d2b7575d35237b.patch"

)
sha256sums=('89b5719dce50a0c6fe901d8de12f72af4116ea86d2b453156922ddeec08e3426'
  'SKIP'
  'SKIP'
  'c774454e31757796cf02078cc04d4f27b6180d718e1edab4148340879a6b64c5'
  'bc52b10c8c9d663a55cba178bb05436474a611542db38fdfcaea029858631591'
  '1cd9c0f1ee71d3c87e8303470dfffc5eb16c06557d355a3b6197bfecbe48fcf2'
  '74f27ee26ecf97d226eff74530f43740a69fd8a4e0a98a66dc526c0344ff2655'
  'f8ab9e5e3facf4b69c900d6b83e89819e58ed6d3fc717ce9aac0e989321f7104'
  '8604ab0b3621549d798cb539acf9d3847e9c83fbd841ef9dc236ff818515c477'
  '366723f3aa34e8785f1b78385a65438a409fc6bf7061be6a6b07dbc809b70575'
  'b8e89b033c3af68ece5116e9b1a007584cccd904ad17bfdcafca12467ddf1cf2')

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
  find src -name '*.py' -o -name '*.toml' | xargs sed -i "/version =/s/0.0.0/${_pkgver}/g"
  for _dir in src/*; do
    if [ ! -d ${_dir} ]; then
      continue
    fi
    pushd ${_dir}
    if [ -f pyproject.toml ] || [ -f setup.py ]; then
      echo "Building python module in ${_dir}"
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
    # We do not use OpenCOLLADA but we have to include opencascade in  cmake INCLUDE_DIRECTORIES
    -DOPENCOLLADA_INCLUDE_DIRS=/usr/include/opencascade
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
