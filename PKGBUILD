# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openxr"
pkgname="lib32-${_name}"
pkgver=1.1.57
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
sha512sums=('c07a5b8a25d22ad8eff136bb9f5c15c7459e45aeddefcbc78cce29d0a730a5d4ab8ada52af71c7e9d8fb7300d77dbaaf20a8b195159520776c0fab90df6d4739'
            'SKIP')
b2sums=('081ffb4688c8f0d1ef5fae07ca1870c677ee33e887c81997d985fe4f6824361073ba0e12705da2955628b9d7a003bed24424b4c428331958d70cb738274d3cd1'
        'SKIP')
validpgpkeys=(
  '45207B2B1E53E1F2755FF63CC5A2D593A61DBC9D' # Rylie Pavlik <rylie.pavlik@collabora.com>
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find external/python/jinja2 -type f -name "*.py" -exec \
    sed -i 's/from markupsafe import soft_unicode/from markupsafe import soft_str as soft_unicode/g' "{}" +
}

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
