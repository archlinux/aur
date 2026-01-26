# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openxr"
pkgname="lib32-${_name}"
pkgver=1.1.54
pkgrel=1
pkgdesc="An open standard for virtual reality and augmented reality platforms and devices (32-bit)"
arch=(
  'x86_64'
)
url="https://www.khronos.org/openxr/"
_url="https://github.com/KhronosGroup/OpenXR-SDK-Source"
license=(
  'Apache-2.0'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-jsoncpp'
)
makedepends=(
  'cmake'
  'lib32-libglvnd'
  'lib32-mesa'
  'lib32-libx11'
  'lib32-libxrandr'
  'lib32-libxxf86vm'
  'lib32-vulkan-icd-loader'
  'lib32-wayland'
  'python'
  'vulkan-headers'
)
_pkgsrc="${_url##*/}-release-${pkgver}"
source=(
  "${_url}/releases/download/release-${pkgver}/${_pkgsrc}.tar.gz"
  "${_url}/releases/download/release-${pkgver}/${_pkgsrc}.tar.gz.asc"
)
sha256sums=('959be5d4ee500c2426555f335bf7fd5d7fb86754192a1d18fa2a7b3ef7f03005'
            'SKIP')
sha512sums=('be99658ff3d27bd8674dceb8b5d50bfbbfaf2f3667a8c38d6afb0cdb2701881c945a4c423ce68e4591cc468a9a499803ffb05a9a610f52a1c47fca97d73e13d8'
            'SKIP')
validpgpkeys=(
  '45207B2B1E53E1F2755FF63CC5A2D593A61DBC9D' # Rylie Pavlik <rylie.pavlik@collabora.com>
)

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='Release' # None
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D BUILD_TESTS:BOOL=OFF # ON
    -D PRESENTATION_BACKEND=xlib
    -D DYNAMIC_LOADER:BOOL=ON
  )

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${excluded_tests}"
#   )

#   cd "${srcdir}"
#   ctest --test-dir "${_pkgsrc}/build" "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
