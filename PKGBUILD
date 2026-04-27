# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openxr"
pkgname="lib32-${_name}"
pkgver=1.1.58
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
sha512sums=('df3f3617e174636a59995a2260846381929f1131d5bca600b83c3cb92f1f5a04fe4ab86b8d7b305110e9234de3f5319e26a278faa219fadc6741553a4a63bd27'
            'SKIP')
b2sums=('193a68983e5f1dd9645ea72b1bea9a38d30c21d23cc2676722eb77659d2083f8397696bbe47a3da8a97564ed11a5e922f8560c2ba302fb8595290fca4f8e7983'
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
