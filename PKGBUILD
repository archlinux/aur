# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="cairomm"
_name="${_basename}-1.16"
pkgname="lib32-${_name}"
pkgver=1.18.0
pkgrel=1
pkgdesc="C++ bindings for Cairo (32-bit)"
url="https://www.cairographics.org/cairomm"
_url="https://gitlab.freedesktop.org/cairo/${_basename}"
arch=('x86_64')
license=('LGPL-2.0-or-later AND MPL-1.1')
depends=("${_name}" 'lib32-cairo>=1.14' 'lib32-gcc-libs' 'lib32-glibc'
         'lib32-libsigc++-3.0')
makedepends=('meson>=0.55' 'mm-common')
provides=("lib${_name}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('aec941f5b1c25392fec2b079edbd322d54520efc7c6a7a48eef111e14a67ca64')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D build-documentation=false \
    -D build-examples=false \
    -D build-tests=false
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}
