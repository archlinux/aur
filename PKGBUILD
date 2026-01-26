# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="graphite"
pkgname="lib32-${_name}"
pkgver=1.3.14
pkgrel=1
pkgdesc='A "smart font" system to handle the complexities of lesser-known languages of the world (32-bit)'
arch=(
  'x86_64'
)
url="https://graphite.sil.org"
_url="https://github.com/silnrsi/${_name}"
license=(
  'LGPL-2.1-or-later OR MPL-2.0 OR GPL-2.0-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
)
makedepends=(
  'cmake'
  'lib32-freetype2'
  'lib32-gcc-libs'
)
provides=(
  "lib${_name}2.so"
)
_pkgsrc="graphite2-${pkgver}"
source=(
  "${_url}/releases/download/${pkgver}/${_pkgsrc}.tgz"
  "${_name}_gcc15.patch"
)
sha256sums=('f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d'
            '2296d1c189cfb129403f83e7a704a333147856b37475320965c463386ef9d8ef')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_gcc15.patch"
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
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_SKIP_INSTALL_RPATH:BOOL=ON
    -D GRAPHITE2_COMPARE_RENDERER:BOOL=OFF
    -D GRAPHITE2_VM_TYPE=direct
  )

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
