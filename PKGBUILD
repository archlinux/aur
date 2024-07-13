# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=124
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://github.com/polkit-org/polkit"
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  lib32-glib2
  lib32-glibc
  lib32-systemd
  polkit
)
makedepends=(
  git
  lib32-expat
  lib32-pam
  meson
)
provides=(libpolkit-gobject-1.so)
source=(
  "git+$url#tag=$pkgver"
)
b2sums=('a79cae1f57c652bba5d979ff88101ce6840a5b68a8178c11b813d66efd04c61e8bfb675ea4868d11ee7121e2d4cfe8143bdd7a514e1dd4b49e040831fae361d9')

prepare() {
  cd polkit
}

build() {
  local meson_options=(
    --cross-file lib32
    -D introspection=false
    -D libs-only=true
    -D os_type=redhat
    -D polkitd_uid=102
    -D polkitd_user=polkitd
    -D session_tracking=libsystemd-login
    -D tests=true
  )

  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/usr/{include,lib,share}
}

# vim:set sw=2 sts=-1 et:
