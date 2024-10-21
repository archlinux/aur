# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
pkgver=0.8.1_alpha2410210627
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
  'mpfr'
  'opencascade'
  'opencollada'
  'python'
  'python-numpy'
  'python-jinja'
  'python-ordered-set'
  'python-pytz'
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

  "001-libsvgfill.patch::https://github.com/sukanka/svgfill/commit/47a6016.patch"
  "002-fix-for-cgal6.0.patch::https://github.com/sukanka/IfcOpenShell/commit/02c9034.patch"
  "003-skip-install-python-package-only-install-wrapper.patch::https://github.com/sukanka/IfcOpenShell/commit/725d509.patch"
  "004-add-shared-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/0a6ff03.patch"
  "005-install-missing-files-skip-redundant-files.patch::https://github.com/sukanka/IfcOpenShell/commit/fcc902b.patch"
  "006-fix-rpath.patch::https://github.com/sukanka/IfcOpenShell/commit/96b6f8d.patch"

)
sha256sums=('afdca4ec52dc1ead7618c94838ce4e2d76c8c20393b5a96f0f8efbac183ac0b7'
            'SKIP'
            'SKIP'
            'SKIP'
            'f000262395449808c32e10664468ec2acd2a22e04b202037f15e03611506cfc5'
            '1651288a6a618b018277e1b3417502e1a6965a51b557e60d9f1eae4fda768da3'
            'ed53b683ccf6ca7e114558a3c75cdc97fe5e4935712ce7c7499738dd39edaea7'
            'b18d6a595985e066e070373c2f8a6e8c9a18666ce46156cdc532d29292da85e5'
            '8604fb3c0f733839435e2d6c91b2b5abaa5198ad3f034121fa10145ac9763919'
            'edb7d3610d52e05cdaf98b7c2939b2deeabfed238fee641d0c62b30b88a878b4'
            '75504aabcc4c05d058537a3bfc6384ca242732c71e15c4f716783eebbdb06f83')

_iosdir="IfcOpenShell-${_vername}-${pkgver//_/-}"

prepare() {
  mv bpypolyskel-1.1.2 bpypolyskel
  cp -ar svgpp/* svgfill/3rdparty/svgpp
  cp -ar svgfill/* ${_iosdir}/src/svgfill
  cp -ar ifc-to-cityjson/* ${_iosdir}/src/ifcconvert/cityjson
  cd ${_iosdir}
  patch --strip=1 --ignore-whitespace <../002-fix-for-cgal6.0.patch
  patch --strip=1 --ignore-whitespace <../003-skip-install-python-package-only-install-wrapper.patch
  patch --strip=1 --ignore-whitespace <../004-add-shared-libs.patch
  patch --strip=1 --ignore-whitespace <../005-install-missing-files-skip-redundant-files.patch
  patch --strip=1 --ignore-whitespace <../006-fix-rpath.patch
  pushd src/svgfill
  patch --strip=1 --ignore-whitespace <${srcdir}/001-libsvgfill.patch
  popd
  sed -i src/ifcwrap/CMakeLists.txt -e 's|libsvgfill|svgfill|g'
  sed -i 's|AABB_traits|AABB_traits_3|g' \
    src/ifcconvert/validate_space_boundaries.cpp \
    src/ifcconvert/validation_utils.h \
    src/ifcconvert/cityjson/global_execution_context.h
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
  cd "${srcdir}/build"
  DESTDIR="$pkgdir" ninja install

  # Install license file
  cd "${srcdir}/${_iosdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING.LESSER -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install python modules
  find src -name '*.whl' -print0 | xargs -0 -I {} python -m installer --destdir="$pkgdir" {}

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
