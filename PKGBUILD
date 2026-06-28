# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libvpl"
pkgname="lib32-${_name}"
pkgver=2.17.0
pkgrel=1
pkgdesc="Intel Video Processing Library (32-bit)"
arch=(
  'x86_64'
)
url="https://intel.github.io/libvpl/"
_url="https://github.com/intel/${_name}"
license=(
  'MIT'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cmake>=3.13.0'
)
provides=(
  "lib32-onevpl=${pkgver}"
  "${_name}.so"
)
conflicts=(
  "lib32-onevpl"
)
replaces=(
  "lib32-onevpl"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('4de3e2faf1e8307fb282e4a43f443191810f6a6b0a484fffa7995ba1c814c6ec')

build() {
  export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/} -m32"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/} -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D CMAKE_INSTALL_SYSCONFDIR:PATH='/etc'
    -D BUILD_EXAMPLES:BOOL=OFF
    -D BUILD_TESTS:BOOL=ON
    -D INSTALL_EXAMPLES:BOOL=OFF
    -D VPL_INSTALL_LICENSEDIR:PATH="share/licenses/${_name}"
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}"
  rm -rf "etc"

  cd "usr"
  rm -rf "bin" "include" "share"
}
