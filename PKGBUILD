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
pkgver=3.8.1
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
)
b2sums=('54e139d0af2d3f2e7c51f9cf82fa8841b108f0dc1980ac01057c319e8771de219704e60f07a75060769195c08da628eb97d407735150ba6d3c401d7d5bde098f'
        '65d135a39a242518c2cda0ba8353f3512ac25af208cfc1d18377c2958d80805d70f3db30b1997f6b88fc1c8fe1270d76e629ec6db23e5c45fc75028497bb829b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_optional_fastdxt.patch"

  sed -i 's/set(CMAKE_CXX_STANDARD 14)/set(CMAKE_CXX_STANDARD 17)/' 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
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
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"

  cd "${_pkgsrc}"
  make -C docs html
  rm -f docs/build/html/.buildinfo
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_options[@]}"
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
