# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=126
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
  dbus
  git
  glib2-devel
  lib32-pam
  meson
  systemd
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
source=(
  "git+$url#tag=$pkgver"
  0001-meson-Support-explicit-GID.patch
  0002-meson-Detect-Arch-Linux-and-set-the-UID-and-GID.patch
)
b2sums=('20659c1a622208e1db7d5f65c5ab75a6a35c55472b5abdadc5405fb83f678e7eb9fe4ac32b1947f6956cc1204f5caa2cad2f5db81de7ea49cdb13bd309c94fa4'
        'a9d5b0cc874abfb5a26f1a70230dc681213703c5eb44f1cf8c59550f7120d077f33c6ef0a0a509b4b878067e38c8a4446e778a7c6d287d5ca28f52e107f73fc4'
        '21471078956d1646539d0b8eda4a74e14790e3d0141bb5412a9a0e8824dcb0025537cbbd528a90ead2cd736c8b59f13d3fc5f4f872e35cf1626baf2c13541b07')

prepare() {
  cd polkit
  git apply -3 ../0001-meson-Support-explicit-GID.patch
  git apply -3 ../0002-meson-Detect-Arch-Linux-and-set-the-UID-and-GID.patch
}

build() {
  local meson_options=(
    --cross-file lib32
    -D gettext=true
    -D introspection=false
    -D libs-only=true
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
