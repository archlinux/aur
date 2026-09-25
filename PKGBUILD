# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="vid.stab"
pkgname="lib32-${_name}"
pkgver=1.1.2
pkgrel=1
pkgdesc="Video stabilization library (32-bit)"
arch=(
  'x86_64'
)
url="http://public.hronopik.de/vid.stab"
_url="https://github.com/georgmartius/${_name}"
license=(
  'GPL-2.0-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cmake>=2.8.5'
)
provides=(
  "lib${_name//.}.so"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('17feebc900a46b266b9b1fc15aca0c4c310b2434d92324e5288fb542215f82d3894f6c5240524191b3009783073bcc782489adf3b9cd5f5e5667ad81b60cbff4')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
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
#   ctest "${ctest_options[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
