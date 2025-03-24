# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="gtkmm"
pkgver=4.18.0
_name="${_basename}-${pkgver%%.*}.0"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="C++ bindings for GTK 4 (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}>=${pkgver}" 'lib32-cairo' 'lib32-cairomm-1.16'
         'lib32-gcc-libs' 'lib32-gdk-pixbuf2>=2.35.5' 'lib32-glib2'
         'lib32-glibc' 'lib32-glibmm-2.68' 'lib32-graphene'
         'lib32-gtk4>=4.15.5' 'lib32-libsigc++-3.0' 'lib32-pangomm-2.48>=2.50'
         'lib32-vulkan-icd-loader')
makedepends=('meson>=0.62' 'mm-common')
checkdepends=('xorg-server-xvfb')
provides=("lib${_name}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('2ee31c15479fc4d8e958b03c8b5fbbc8e17bc122c2a2f544497b4e05619e33ec')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D maintainer-mode=true
    -D build-documentation=false
    -D build-demos=false
    -D build-tests=true
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  xvfb-run -s '-nolisten local' meson test -C "${_pkgsrc}/build" --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
