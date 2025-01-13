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
        'b891682aa88beab15cd90a7681060168c5cb4de7c3d75dd9dba13a8281eb8de6ea81436b2dc8ddf404c5016eba422519fc9f28ecd2648c7ac811330196eb4a7d'
        'f6dc32e6b56129bf8e181c2cce91c868eddb9e6c82e3d674f3ce5085c0ecde005b625b621c1ef28d3afbdcfbfc4d7586dbd4dfed5a611f251388c81270bc380b')

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
