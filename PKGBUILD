# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="avisynthplus"
pkgname="lib32-${_name}"
pkgver=3.7.5
pkgrel=1
pkgdesc="An improved version of the AviSynth frameserver (32-bit)"
arch=(
  'x86_64'
)
url="https://avs-plus.net"
_url="https://github.com/AviSynth/AviSynthPlus"
license=(
  'GPL-2.0-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'lib32-devil'
  'lib32-soundtouch'

  'cmake'
)
optdepends=(
  'lib32-devil: for ImageSeq plugin'
  'lib32-soundtouch: for TimeStretch plugin'
)
provides=(
  'libavisynth.so'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "010-avisynthplus-fix-symbol-conflict-with-vmaf.patch::${_url}/commit/d1a32d5229602f181574c95fa0db68bcf1762606.patch?full_index=1"
)
sha256sums=('2533fafe5b5a8eb9f14d84d89541252a5efd0839ef62b8ae98f40b9f34b3f3d5'
            '37c63e98bfe3c5bd2b079b392f5a8e48127fd336bb0575c865d7abcbf74417c5')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/issues/19
  patch -Np1 -i "${srcdir}/010-avisynthplus-fix-symbol-conflict-with-vmaf.patch"
}


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
