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
pkgver=3.8
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://www.pelicanmapping.com/home-1/opensource"
_url="https://github.com/pelicanmapping/${pkgbase}"
license=(
  'LGPL-3.0-only'
)
makedepends=(
  'blend2d'
  'cmake>=3.20'
  'curl'
  'doxygen'
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
_pkgsrc="${_url##*/}-${pkgbase}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgbase}-${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgbase}_optional_fastdxt.patch"
  "${pkgbase}_unbundle.patch"
)
b2sums=('964901a4d37608419aaa82f66872fee0bbdb662d8527997c6b08d7635ed43c45ee157203336af89e89078d979890ff21c3f8ea20d66d61655f2568987fdae202'
        'e57fd25c5cf3eeecd6830cacddfabe690c5f0c50d5191588210519aa4ba8d7f6c0dc317c8b32629f235a6f0cba9c21d79449b41c4613bf28bf5627d962917add'
        '1c6f09c76acd7b78daac4e984b04bced0ba68308d705d1be7b89f1428d6acf18412da4dc77c2226d4e1ca04674336f27251a623cdbc99299c20cdd1add42eebf')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_optional_fastdxt.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_unbundle.patch"

  sed -i 's/set(CMAKE_CXX_STANDARD 14)/set(CMAKE_CXX_STANDARD 17)/' 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D OSGEARTH_INSTALL_SHADERS:BOOL=ON
    -D OSGEARTH_BUILD_TESTS:BOOL=OFF # error
    -D OSGEARTH_BUILD_ZIP_PLUGIN:BOOL=OFF # provided by openscenegraph
  )
  # Disable fastdxt driver on non x86 arches, requires x86 intrinsics
  if [[ "${CARCH}" != "x86_64" && ! "${CARCH}" =~ ^i[3-6]86$ ]]; then
    cmake_options+=(-DDISABLE_FASTDXT=ON)
  fi

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  make -C docs html
  rm -f docs/build/html/.buildinfo
}

check() {
  local ctest_exclude_regex=""
  local ctest_arguments=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
}

package_osgearth() {
  depends=(
    'blend2d'
    'curl'
    'gdal'
    'geos'
    'glibc'
    'lerc'
    'libgl'
    'libgcc'
    'libstdc++'
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
