# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=ifcopenshell
pkgver=0.8.4_alpha2508261505
_vername=bonsai
pkgrel=2
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
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/refs/tags/${_vername}-${pkgver//_/-}.tar.gz"
  "git+https://github.com/svgpp/svgpp.git"
  "git+https://github.com/IfcOpenShell/svgfill.git"
  "git+https://github.com/IfcOpenShell/ifc-to-cityjson.git"
  "bpypolyskel-1.1.2.tar.gz::https://github.com/prochitecture/bpypolyskel/archive/refs/tags/v1.1.2.tar.gz"

  "003-skip-install-python-package-only-install-wrapper.patch::https://github.com/sukanka/IfcOpenShell/commit/e6ceb758.patch"
  "004-add-shared-libs.patch::https://github.com/sukanka/IfcOpenShell/commit/9ec690d.patch"
  "005-install-missing-files-skip-redundant-files.patch::https://github.com/sukanka/IfcOpenShell/commit/1349d8e.patch"
  "006-fix-rpath.patch::https://github.com/sukanka/IfcOpenShell/commit/b0c80ed.patch"

)
sha256sums=('182f6c37c069c875f68b8f628c5433831cc21adcedd086c6d96778df5f58016e'
            'SKIP'
            'SKIP'
            'SKIP'
            'f000262395449808c32e10664468ec2acd2a22e04b202037f15e03611506cfc5'
            '2efdab4233e3d58a0ac03a746b57fcad1017a3db39abed12d4f2ccf33768674b'
            'e54ff840fef44ae9d746e418d409db31e10e591ef0f9808708f56260adea53da'
            'd32e61dadac3177b98de40d9587206fe9d03d987ac08323bc67f10512620ef91'
            '1b4be552fadad11362e09103c6fdf6f9400b969ca6dad9128a0f8dd35ab4026c')

_iosdir="IfcOpenShell-${_vername}-${pkgver//_/-}"

prepare() {
  mv bpypolyskel-1.1.2 bpypolyskel
  cp -ar svgpp/* svgfill/3rdparty/svgpp
  cp -ar svgfill/* ${_iosdir}/src/svgfill
  cp -ar ifc-to-cityjson/* ${_iosdir}/src/ifcconvert/cityjson
  cd ${_iosdir}
  patch --strip=1 --ignore-whitespace <../003-skip-install-python-package-only-install-wrapper.patch
  patch --strip=1 --ignore-whitespace <../004-add-shared-libs.patch
  patch --strip=1 --ignore-whitespace <../005-install-missing-files-skip-redundant-files.patch
  patch --strip=1 --ignore-whitespace <../006-fix-rpath.patch
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
