# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
pkgname=ifcopenshell-stable
_pkgver=0.8.5
pkgver=${_pkgver//-/}
_vername=bonsai
pkgrel=3
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="https://ifcopenshell.org/"
license=('LGPL-3.0-or-later' 'GPL-3.0-or-later')

conflicts=(
  'ifcopenshell'
  'ifcopenshell-git'
)

depends=(
  'boost-libs'
  'hdf5'
  'hicolor-icon-theme'
  'libxml2-legacy'
  'mpfr'
  'opencascade'
  'python'
  'python-jinja'
  'python-lark-parser'
  'python-numpy'
  'python-platformdirs'
  'python-pytest'
  'python-pytz'
  'python-requests'
  'python-typing_extensions'
)

optdepends=(
  'pyside2'
  'python-pyparsing'
  'python-scikit-learn'
  'python-pydantic'
  'python-aiohttp'
  'python-pyqt5'
  'python-dateutil'
  'python-xsdata: bonsaï'
  'python-shapely: bonsaï'
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

_patch_url_prefix="https://github.com/IfcOpenShell/IfcOpenShell/commit"
source=(
  "https://github.com/IfcOpenShell/IfcOpenShell/archive/refs/tags/${_vername}-${_pkgver}.tar.gz"
  "git+https://github.com/svgpp/svgpp.git"
  "git+https://github.com/IfcOpenShell/svgfill.git"
  "bpypolyskel-1.1.3.tar.gz::https://github.com/prochitecture/bpypolyskel/archive/refs/tags/v1.1.3.tar.gz"

  "001-skip-install-python-wrapper.patch::${_patch_url_prefix}/95bf1194db09a89a6106954bc05b2b62e00e06cd.patch"
  "002-add-shared-libs.patch::${_patch_url_prefix}/a592a0c2acb5692e988129f26b6d48a0bd180dd6.patch"
  "003-fix-rpath.patch::${_patch_url_prefix}/5b646d000e6eb7d101f15404aa4f7742aa02c21f.patch"

  # Modified from "${_patch_url_prefix}/21d3dcdab23199aab66c86b35be9e145b98f8450.patch"
  "004-fix-boost189.patch"

  "005-fix-ifcsverchok-setup.patch::${_patch_url_prefix}/e9618346cb477108ca4850c342729c82124e74eb.patch"
  "006-use-spdx-license.patch::${_patch_url_prefix}/dec0d6bc2ab3da60a1d6bb1b3359db94695c0af2.patch"
  "007-fix-ld-eror.patch::${_patch_url_prefix}/ea018ae720a7d575422ed28ffb10f630e7e6420f.patch"
  "008-fix-for-boost-1.89-explicit-optional.patch::${_patch_url_prefix}/89b3f95c7ffaa90c2c583038fe8c75d0be2e0317.patch"

  # fix cgal version 6.2
  "009-fix-cgal-6.2-add-Point_d_4d_Less-comparator.patch::${_patch_url_prefix}/9d956f18b78b87373445fb5628d21acc2329de9f.patch"
)

sha256sums=(
  'd44c106bc61c4c98171cf84479ab11715534f50d9b4517f80fc33133429117df'
  'SKIP'
  'SKIP'
  'c774454e31757796cf02078cc04d4f27b6180d718e1edab4148340879a6b64c5'

  '790373b719561733d5ba3fbd44c6419828fc0bbe66313ecdb78693e585c0fbcb'
  'c40dc88578ba8f01b1f07fe084b606df9cc997caac511ab4aedee8b639c8adad'
  '816f4ec952e02f3ed1c244650db1eabfaf9d70f5675261c6537bb25c8805a580'
  'ef017e534884661fad56868ea03e55d616a10bbeab6cba043690fb47b7284c96'
  '4e705b7cd4711f6a9c6ef61ca6134c952d0a8a8f8ed7550a33ad753f039b96b5'
  'adc1de9d21a9f1aae06cf88ac00b5093a8e171fd3e69132f98b8a61be60e0cc2'
  '9b25ef16cb438f50f08dbe6e60201b6ecf157b77326410d5cc10c2d3254d050d'
  '88e75be92925e4aa11458694aa3d0f86b2c20dd7b0bd0026fcbd5e71e5fc9998'

  '45000e665535886e33152849a6179e60de0b83e588c540204ebd767e1e2012a0'
  )

_iosdir="IfcOpenShell-${_vername}-${_pkgver}"

_apply_patch() {
  cd "${srcdir}/${_iosdir}"
  for p in $srcdir/*.patch; do
    echo Patch ${p}
    patch -p1 -l <${p}
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

  # If your system becomes unresponsive while building, let it be known that this code is memory hungry. On my system, I had to limit the number of parallel build processes to 8.
  # Over 10 parallel build processes, it would sometime eat out all the RAM (32GB), making the system unresponsive and breaking the build.
  # Add "-j X" option at the end of "ninja -C build", where X is the number of parallel processes to build with.
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
