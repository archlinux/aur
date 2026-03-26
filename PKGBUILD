# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.49.0
pkgrel=1
pkgdesc="Configuration database system (32-bit)"
url="https://gitlab.gnome.org/GNOME/dconf"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  dconf
  lib32-gcc-libs
  lib32-glib2
  lib32-glibc
)
makedepends=(
  git
  glib2-devel
  lib32-dbus
  meson
)
provides=(libdconf.so)
source=(
  "git+https://gitlab.gnome.org/GNOME/dconf.git#tag=$pkgver"
)
b2sums=('8be63a8eb2d7c2f3067b051577ad80793c4e0c93784e738fe81d5d6a79407a683861237ae27631554ad5dd2421bb1a10cb2fd21c36cebd9ea57e74ae7581ab29')

prepare() {
  cd dconf
}

build() {
  local meson_options=(
    --cross-file lib32
    -D bash_completion=false
    -D man=false
    -D vapi=false
  )

  arch-meson dconf build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{bin,include,lib,share}
}

# vim:set sw=2 sts=-1 et:
