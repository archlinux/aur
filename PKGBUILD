# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="rocky"
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ SDK for rendering maps and globes"
arch=(
  'x86_64'
)
url="https://github.com/pelicanmapping/${pkgname}"
license=(
  'MIT'
)
depends=(
  'fmt'
  'gdal'
  'glibc'
  # 'imgui'
  'libgcc'
  'libstdc++'
  'proj'
  'spdlog'
  'sqlite'
  'zlib'
)
makedepends=(
  'cmake>=3.21'
  'entt'
  'glm'
  'nlohmann-json'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('a196a12057078a1b9703d3f2393fd55caf0a81d5c918fec456c23cd887ff8d84511d943f89c72dfeb7a3356dce868c8ef428c3d6b922d781ba359ba8981091d4')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/add_subdirectory(tests)/d' \
      -i 'src/CMakeLists.txt'
}

build() {
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D ROCKY_RENDERER_VSG:BOOL=OFF # OOD
    -D ROCKY_MAX_NUMBER_OF_VIEWS=4
  )

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_arguments[@]}" 
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_arguments=(
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
