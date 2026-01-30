# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="vid.stab"
pkgname="lib32-${_name}"
pkgver=1.1.1
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
b2sums=('e2ce03d24358404c617816466ad3fd715999ef4d391617e9cec7923353ba2ce4ac3b3eedce67f3fadf3bd6fdfb2e4516a5b95c3fca9f613e367b1490ec78ae0a')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${excluded_tests}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
