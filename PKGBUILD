# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="libsigc++"
_name="${_basename}-3.0"
pkgname="lib32-${_name}"
pkgver=3.6.0
pkgrel=1
pkgdesc="Callback Framework for C++ (32-bit)"
url="https://libsigcplusplus.github.io/libsigcplusplus"
# _url="https://github.com/libsigcplusplus/libsigcplusplus"
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}")
makedepends=('meson>=0.55' 'mm-common')
provides=('libsigc-3.0.so')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" build \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D build-documentation=false \
    -D validation=false \
    -D build-pdf=false \
    -D build-examples=false \
    -D build-tests=true \
    -D benchmark=false
  meson compile -C build
}

check() {
  cd "${srcdir}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}

# vim: ts=2 sw=2 et:
