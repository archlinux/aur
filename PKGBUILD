# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <asyync1024 at proton dot me>

_name="openxr"
pkgname="lib32-$_name"
pkgver=1.1.60
pkgrel=1
pkgdesc="An open standard for virtual reality and augmented reality platforms and devices (32-bit)"
arch=('x86_64')
url="https://www.khronos.org/openxr/"
_url="https://github.com/KhronosGroup/OpenXR-SDK-Source"
license=('Apache-2.0')
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
sha512sums=('cfb661729c7b79a2b8ad12b441fab1327814de020df987b8855e6e53b0a760651819fc08b10b46653e5cebac0167e0f089a1f05c494007f229f24ff1ef83c455'
            'SKIP')
b2sums=('8c4ef26d800e559f8d87c3eaf077334090514684c03cccc9afe37af91567f9fe10719238317daaded23b55ab2c84ea488146c1a2cd8d3d860fa6817a21487481'
        'SKIP')
validpgpkeys=('45207B2B1E53E1F2755FF63CC5A2D593A61DBC9D') # Rylie Pavlik <rylie.pavlik@collabora.com>

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
    -B "$_pkgsrc/build"
    -S "$_pkgsrc"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='Release' # None
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D BUILD_TESTS:BOOL=OFF # ON
    -D PRESENTATION_BACKEND=xlib
    -D DYNAMIC_LOADER:BOOL=ON
  )

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
  DESTDIR="$pkgdir" cmake --install "$_pkgsrc/build"

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"
}
