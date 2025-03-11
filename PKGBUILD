# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="glibmm"
_name="${_basename}-2.68"
pkgname="lib32-${_name}"
pkgver=2.84.0
pkgrel=1
pkgdesc="C++ bindings for GLib (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glib2>=2.83.4'
         'lib32-glibc' 'lib32-libsigc++-3.0')
makedepends=('meson>=0.62' 'mm-common')
checkdepends=('lib32-glib-networking')
provides=('lib'{'giomm','glibmm'{,_generate_extra_defs}}'-2.68.so')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('56ee5f51c8acfc0afdf46959316e4c8554cb50ed2b6bc5ce389d979cbb642509')

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
    -D build-examples=false
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
