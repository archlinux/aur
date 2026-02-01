# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openh264"
pkgname="lib32-${_name}"
pkgver=2.6.0
pkgrel=1
_gtestver=1.8.1 # https://github.com/cisco/openh264/blob/v2.6.0/Makefile#L33
pkgdesc="H.264 encoder and decoder (32-bit)"
arch=(
  'x86_64'
)
url="https://www.openh264.org"
_url="https://github.com/cisco/${_name}"
license=(
  'BSD-2-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'meson>=0.52'
  'nasm'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "https://github.com/google/googletest/archive/refs/tags/release-${_gtestver}/googletest-release-${_gtestver}.tar.gz"
)
sha256sums=('558544ad358283a7ab2930d69a9ceddf913f4a51ee9bf1bfb9e377322af81a69'
            '9bf1fe5182a604b4135edc1a425ae356c9ad15e9b23f9f12a02e80184c3a249c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  ln -vsf "../googletest-release-${_gtestver}" "gtest"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    --cross-file lib32
  )

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" "${meson_options[@]}" 
  meson compile -C "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  meson test -C "${_pkgsrc}/build" --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
