# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=0.120
pkgrel=4
pkgdesc='Application development toolkit for controlling system-wide privileges'
arch=(x86_64)
license=(LGPL)
url=https://www.freedesktop.org/wiki/Software/polkit/
depends=(
  lib32-expat
  lib32-glib2
  lib32-pam
  lib32-systemd
  polkit
)
makedepends=(
  meson
  git
)
_tag=92b910ce2273daf6a76038f6bd764fa6958d4e8e
source=(
  git+https://gitlab.freedesktop.org/polkit/polkit.git#tag=${_tag}
  meson-0.61.diff
  multilib.diff
)
sha256sums=(
  SKIP
  45d08bbb76e1e22ca8e698df04652b7aceaded34f9b76ce6b68152fb26b0de8d
  7271f97282d22b58b74cf9089fa3a83c799cde184eb6e06a83164692362e50fe
)

pkgver() {
  cd polkit

  git describe --tags
}

prepare() {
  cd polkit

  # CVE-2021-4034
  git cherry-pick -n a2bf5c9c83b6ae46cbd5c779d3055bff81ded683

  # Fix build with Meson 0.61.0
  git apply -3 ../meson-0.61.diff

  # Don't build the backend
  git apply -3 ../multilib.diff
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  arch-meson polkit build \
    --libdir=/usr/lib32 \
    -D session_tracking=libsystemd-login \
    -D os_type=redhat \
    -D tests=true \
    -D introspection=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -r "$pkgdir"/{etc,usr/{bin,include,lib,share}}
}

# vim: ts=2 sw=2 et:
