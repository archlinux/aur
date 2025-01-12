# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_name="glibmm"
pkgname="lib32-${_name}"
pkgver=2.66.7
pkgrel=1
pkgdesc="C++ bindings for GLib (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-gcc-libs' 'lib32-glib2>=2.61.2' 'lib32-glibc'
         'lib32-libsigc++>=2.9.1')
makedepends=('meson>=0.55' 'mm-common')
checkdepends=('lib32-glib-networking')
provides=('lib'{'giomm','glibmm'{,'_generate_extra_defs'}}'-2.4.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('fe02c1e5f5825940d82b56b6ec31a12c06c05c1583cfe62f934d0763e1e542b3')

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
  rm -rf "include"
}
