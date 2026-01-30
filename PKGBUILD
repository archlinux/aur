# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libsoxr"
pkgname="lib32-${_name}"
pkgver=0.1.3
pkgrel=2
pkgdesc="The SoX Resampler library that aims to give fast and high quality results for any constant resampling ratio (32-bit)"
arch=(
  'x86_64'
)
url="https://sourceforge.net/p/soxr/wiki/Home/"
license=(
  'LGPL-2.1-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'cmake>=3.1'
)
provides=(
  "${_name}.so"
  "${_name}-lsr.so"
)
_pkgsrc="soxr-${pkgver}-Source"
source=(
  "https://downloads.sourceforge.net/project/soxr/${_pkgsrc}.tar.xz"
)
b2sums=('5b7078f71404b9ef83917dcabc0c99cf17fd625d3e033d1b934382a7b60e55e359931a6ab53f8adaf955c0d811d6cbf231cd6a226549560b3506a3867e845607')

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
    # -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D LIB_SUFFIX:STRING='32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D BUILD_EXAMPLES:BOOL=OFF
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D WITH_AVFFT:BOOL=OFF # ON
    -D WITH_LSR_BINDINGS:BOOL=ON
    -D WITH_OPENMP:BOOL=ON
    -D WITH_PFFFT:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
