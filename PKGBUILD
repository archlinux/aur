# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openxr"
pkgname="lib32-${_name}"
pkgver=1.1.59.1
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
sha512sums=('3d9a0c2b340f2ad56dd488aebf50e22d229570fc4957fb59090d35672b7454371f736b6160b484a494ad20f82a03bb522614501bd1e775be5ca750b7de33c001'
            'SKIP')
b2sums=('9153dc53253a009f35045d183bdf635ccfd9882546f53331156ce1bcd5cc7aa118dcb9a1222da6da6d30f0431e0cd1f9f6a344e10c8885a2ccca1d06b11033bd'
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
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
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
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest  "${ctest_options[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
