# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

_Name="osgEarth"
pkgbase="${_Name,,}"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-docs"
)
pkgver=3.7.2
pkgrel=4
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://www.pelicanmapping.com/home-1/opensource"
_url="https://github.com/gwaldron/${pkgbase}"
license=('LGPL-3.0-only')
makedepends=(
  'blend2d'
  'cmake>=3.20'
  'curl'
  'doxygen'
  'gcc-libs'
  'gdal'
  'geos'
  'glew'
  'glibc'
  'lerc'
  'libgl'
  'libwebp'
  'meshoptimizer'
  'openscenegraph'
  'protobuf'
  'python-sphinx-markdown-tables'
  'python-myst-parser'
  'rapidjson'
  'spdlog'
  'sqlite'
)
_pkgsrc="${pkgbase}-${pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgbase}-${pkgver}.tar.gz"
  "${pkgbase}_optional_fastdxt.patch"
  "${pkgbase}_unbundle.patch"
  "${pkgbase}_link_lerc.patch"
  "${pkgbase}_blend2d-0.20.0.patch::${_url}/pull/2856.patch?full_index=1"
  "${pkgbase}_blend2d-0.21.2.patch::${_url}/pull/2859.patch?full_index=1"
)
b2sums=('c794995bbe221d8f719a46d4a0c456184975feb6359a37d8bb23ed6d5abd038611df89239e57e57fdfd2a5fd1943515639ec72916d9ff05d1a5eebaab1167a4c'
        'e57fd25c5cf3eeecd6830cacddfabe690c5f0c50d5191588210519aa4ba8d7f6c0dc317c8b32629f235a6f0cba9c21d79449b41c4613bf28bf5627d962917add'
        'e493e05367befdc963a3561bfd04f5b25fc04c02fa3aeb7a7bcecc48945369c22ff91f2b049e36209b95c7f10a06ab68d1607ce23e23a1475eb37b0193ee33e8'
        'c1f8f84d6e9477a26489e55a743cb727fbe327c5d472d35a7b58292db6d2312002a277b3c4ed8986f5b89106a544f8e203da25f682678c2b22a3c7eb9be9b0dd'
        '97eb8529a7b895d0059a505acd66964c540e641f75c8809cc52479592df3412f59c27daafe705fa63c55409bd0b5c35185634a6674bd8ed61f359f3bdd9c1ebc'
        'e28ecb0d9a64c67652d021ff1d909fc42f693b3fea43710388a03feb785bd87eadd0c521bd763128a5761b39813780db318767d20188fcc2f8e9db1f69e75aac')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_optional_fastdxt.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_unbundle.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_link_lerc.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_blend2d-0.20.0.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_blend2d-0.21.2.patch"

  sed -i 's/set(CMAKE_CXX_STANDARD 14)/set(CMAKE_CXX_STANDARD 17)/' 'CMakeLists.txt'
}

build() {
  export CXXFLAGS+=" -Wno-error=format-security"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:STRING='lib'
    -D OSGEARTH_INSTALL_SHADERS:BOOL=ON
    -D OSGEARTH_BUILD_TESTS:BOOL=ON
    -D OSGEARTH_BUILD_ZIP_PLUGIN:BOOL=OFF # provided by openscenegraph
    -W no-dev
  )
  # Disable fastdxt driver on non x86 arches, requires x86 intrinsics
  if [[ "${CARCH}" != "x86_64" && ! "${CARCH}" =~ ^i[3-6]86$ ]]; then
    cmake_options+=(-DDISABLE_FASTDXT=ON)
  fi

  cd "${srcdir}"
  sed -i 's|blend2d\.h|blend2d/blend2d\.h|g' "${_pkgsrc}/src/osgEarth/FeatureRasterizer.cpp"

  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  make -C docs html
  rm -f docs/build/html/.buildinfo
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package_osgearth() {
  depends=(
    'blend2d'
    'curl'
    'gcc-libs'
    'gdal'
    'geos'
    'glew'
    'glibc'
    'lerc'
    'libgl'
    'libwebp'
    'meshoptimizer'
    'openscenegraph'
    'protobuf'
    'spdlog'
    'sqlite'
  )
  provides=(
    "lib${_Name}.so"
    "lib${_Name}ImGui.so"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  cp -a --no-preserve=ownership "data" "tests" -t "${pkgdir}/usr/share/${pkgbase}"
}

package_osgearth-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/docs/build"
  install -vd "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -a --no-preserve=ownership "html" -t "${pkgdir}/usr/share/doc/${pkgbase}"
}
