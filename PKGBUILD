# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="gtkmm"
pkgver=3.24.10
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="C++ bindings for GTK+ 3 (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}>=${pkgver}" 'lib32-atkmm>=2.24.2' 'lib32-cairomm>=1.12'
         'lib32-gcc-libs' 'lib32-gdk-pixbuf2>=2.35.5' 'lib32-glib2'
         'lib32-glibc' 'lib32-glibmm>=2.54' 'lib32-gtk3>=3.24'
         'lib32-libsigc++' 'lib32-pangomm>=2.38.2')
makedepends=('meson>=0.60' 'mm-common')
checkdepends=('xorg-server-xvfb')
provides=("lib${_basename}-${pkgver%%.*}.0.so" "libgdkmm-${pkgver%%.*}.0.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('7ab7e2266808716e26c39924ace1fb46da86c17ef39d989624c42314b32b5a76')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D maintainer-mode=true \
    -D build-documentation=false \
    -D build-demos=false \
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
  rm -rf "bin" "include" "share"
}
