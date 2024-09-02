# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
pkgver=0.8.1_alpha240902
_vername=bonsai
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Provides static libraries, python3 wrapper and blender addon."
arch=('x86_64' 'i686')
url="http://ifcopenshell.org/"
license=('LGPL-3.0-or-later' 'GPL-3.0-or-later')
depends=(
  'boost-libs'
  'hdf5'
  'mpfr'
  'opencascade'
  'opencollada'
  'python'
  'python-numpy'
  'python-ordered-set'
  'python-typing_extensions'
  'python-requests'

)
optdepends=(
  'python-xsdata: blender bim addon'
  'python-shapely: blender bim addon space generation support'
  'python-svgwrite'
  'python-isodate: blender bim addon'
  'python-pystache: blender bim addon'
  'python-socketio'
  'python-natsort'
  'python-openpyxl'
  'python-odfpy: blender bim addon and ifccobie support'
  'python-xmlschema: blender bim addon, bcf support'
  'python-deepdiff: ifcdiff'
  ##  The following not in AUR
  # 'python-tzfpy'
  # 'python-orderly-set'
  # 'python-pyradiance'

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
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/refs/tags/${_vername}-${pkgver//_/-}.tar.gz"
  "git+https://github.com/svgpp/svgpp.git"
  "git+https://github.com/IfcOpenShell/svgfill.git"
  "git+https://github.com/IfcOpenShell/ifc-to-cityjson.git"
  "bpypolyskel-1.1.2.tar.gz::https://github.com/prochitecture/bpypolyskel/archive/refs/tags/v1.1.2.tar.gz"

  "001-libsvgfill.patch::https://github.com/sukanka/svgfill/commit/af69c5c.patch"
  "002-add-shared-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/011088e.patch"
  "003-install-cityjson-files.patch::https://github.com/sukanka/IfcOpenShell/commit/56766cc.patch"
  "004-skip-install-python-package-only-install-wrapper.patch::https://github.com/sukanka/IfcOpenShell/commit/b7e6f1c.patch"
  "005-only-install-headers-for-serializer.patch::https://github.com/sukanka/IfcOpenShell/commit/208ab42.patch"
  "006-fix-rpath.patch::https://github.com/sukanka/IfcOpenShell/commit/614b511.patch"
  "007-install-missing-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/f48c261.patch"

)
sha256sums=('8761f240ef3e304b09914b0d509e3af1802b19cb020e57608704438c4dcc9bcf'
            'SKIP'
            'SKIP'
            'SKIP'
            'f000262395449808c32e10664468ec2acd2a22e04b202037f15e03611506cfc5'
            'c673bc7a6e6cdb7288577c9a98fa864ebf5d5800ae948b5fd41165004e29d992'
            '44fd888bd2e41820771aab12a431577396036057520ab53989d69e6a62666415'
            '0d82930b081ffeef87cdad4b4392119029de447b9f76cb99398b44d5b4d4c536'
            '75976c985b8d8a04f5a44ef3c22b9b9bb594809670baef8e7e00d67e86d1fd19'
            '5196b4fcc96e277640f46a37afb2989c96afd211e6624d6d798a1fef59c7e778'
            '8aa5b33acef30fc024e4cbbd965bf0cb367ec597b2ade1090fa39e9c69c74926'
            '571efebfa39ed08495deaed18c0198cbaf62f2d4bfcf678a7443bbf2ad7d1f10')

_iosdir="IfcOpenShell-${_vername}-${pkgver//_/-}"

prepare() {
  mv bpypolyskel-1.1.2 bpypolyskel
  cp -ar svgpp/* svgfill/3rdparty/svgpp
  cp -ar svgfill/* ${_iosdir}/src/svgfill
  cp -ar ifc-to-cityjson/* ${_iosdir}/src/ifcconvert/cityjson
  cd ${_iosdir}
  patch --strip=1 --ignore-whitespace <../002-add-shared-libs.patch
  patch --strip=1 --ignore-whitespace <../003-install-cityjson-files.patch
  patch --strip=1 --ignore-whitespace <../004-skip-install-python-package-only-install-wrapper.patch
  patch --strip=1 --ignore-whitespace <../005-only-install-headers-for-serializer.patch
  patch --strip=1 --ignore-whitespace <../006-fix-rpath.patch
  patch --strip=1 --ignore-whitespace <../007-install-missing-libs.patch
  pushd src/svgfill
  patch --strip=1 --ignore-whitespace <${srcdir}/001-libsvgfill.patch
  popd
  sed -i src/ifcwrap/CMakeLists.txt -e 's|libsvgfill|svgfill|g'
}
_build_pymodules() {
  cd "${srcdir}/${_iosdir}"
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
}
build() {
  cd "${srcdir}/${_iosdir}"
  _build_pymodules

  install -d build

  local CMAKE_ARGS=(
    -S ./cmake
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
    -DGMP_LIBRARY_DIR=/usr/lib
    -DMPFR_LIBRARY_DIR=/usr/lib
    -DMPFR_INCLUDE_DIR=/usr/include
    -DJSON_INCLUDE_DIR=/usr/include
    -DSWIG_EXECUTABLE="/usr/bin/swig"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_SHARED_LIBS=ON
    -DGLTF_SUPPORT=ON
  )
  cmake "${CMAKE_ARGS[@]}"

  ninja -C build
}

package() {
  _blender_ver=$(blender --version | grep -Po 'Blender \K[0-9].[0-9]+')
  _python_ver=$(python --version | grep -Po 'Python \K[0-9].[0-9]+')
  cd "${srcdir}/${_iosdir}/build"
  DESTDIR="$pkgdir" ninja install

  # Install license file
  cd "${srcdir}/${_iosdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING.LESSER -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install python modules
  find src -name '*.whl' -print0 | xargs -0 -I {} python -m installer --destdir="$pkgdir" {}

  # extra modules that does not build whl
  cp -rf src/{ifc2ca,ifcsverchok} ${pkgdir}/usr/lib/python${_python_ver}/site-packages
  cp -rf build/ifcwrap/{ifcopenshell_wrapper.py,*.so} ${pkgdir}/usr/lib/python${_python_ver}/site-packages/ifcopenshell

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
