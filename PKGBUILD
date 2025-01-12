# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: Kevin <kevin 'at' archlinux 'dot' org>
# Contributor: criminy <criminy 'at' gmail 'dot' com>

_name="cairomm"
pkgname="lib32-${_name}"
pkgver=1.14.5
pkgrel=1
pkgdesc="C++ bindings for Cairo (32-bit)"
url="https://www.cairographics.org/cairomm"
_url="https://gitlab.freedesktop.org/cairo/${_name}"
arch=('x86_64')
license=('LGPL-2.0-or-later AND MPL-1.1')
depends=("${_name}" 'lib32-cairo>=1.12' 'lib32-gcc-libs' 'lib32-glibc'
         'lib32-libsigc++>=2.6')
makedepends=('meson>=0.55' 'mm-common')
provides=("lib${_name}-1.0.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('80c10611888e84c3a660eea0dafc81b6a9faf3e1d1cc31f950c51b3f7d384fc2')

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
