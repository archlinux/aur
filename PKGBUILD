# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
pkgver=0.7.11_alpha240830
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

  "001-libsvgfill.patch::https://github.com/sukanka/svgfill/commit/af69c5c.patch"
  "002-add-shared-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/011088e.patch"
  "003-install-cityjson-files.patch::https://github.com/sukanka/IfcOpenShell/commit/56766cc.patch"
  "004-skip-install-python-package-only-install-wrapper.patch::https://github.com/sukanka/IfcOpenShell/commit/b7e6f1c.patch"
  "005-only-install-headers-for-serializer.patch::https://github.com/sukanka/IfcOpenShell/commit/91667b6.patch"
  "006-fix-rpath.patch::https://github.com/sukanka/IfcOpenShell/commit/54a4cce.patch"
  "007-install-missing-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/7558599.patch"

)
sha256sums=('6b3d434e3de70d58703a0a50849de31fd70601b569c2777caceb372c34f3e608'
            'SKIP'
            'SKIP'
            'SKIP'
            'c673bc7a6e6cdb7288577c9a98fa864ebf5d5800ae948b5fd41165004e29d992'
            '44fd888bd2e41820771aab12a431577396036057520ab53989d69e6a62666415'
            '0d82930b081ffeef87cdad4b4392119029de447b9f76cb99398b44d5b4d4c536'
            '75976c985b8d8a04f5a44ef3c22b9b9bb594809670baef8e7e00d67e86d1fd19'
            'f92c138eaa20bb787ec3bcaffaa4f74abe797cb11fd0627b78cca18b29bec072'
            'c6b372278b4e4c5d34c03acf81524aa89b10cabe3bcf4d3c0be7d22bef28f2b7'
            'bab3a4a7b58160d70dee9c4598ed0ed7c795ab2bf5aedcbf2e86493119836bf4')

_iosdir="IfcOpenShell-${_vername}-${pkgver//_/-}"

prepare() {
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

  # provides blender plugin
  install -d "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons"
  ln -s /usr/lib/python${_python_ver}/site-packages/${_vername} "${pkgdir}/usr/share/blender/${_blender_ver}/scripts/addons/${__vername}"

}
