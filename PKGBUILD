# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=121
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL)
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
provides=(libpolkit-{agent,gobject}-1.so)
options=(debug)
_commit=827b0ddac5b1ef00a47fca4526fcf057bee5f1db  # tags/121
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=${_commit}"
  multilib.diff
)
b2sums=('SKIP'
        '2ee4018b0429e637429abcecb4855436e072a5d562060bde51d47d7db447a200bfe08ac3d247a0b662e5c345b5641169203c00f3bbe63187b5025c9e8337ef44')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit

  # Don't build the backend
  git apply -3 ../multilib.diff
}

build() {
  local meson_options=(
    --libdir=/usr/lib32
    -D introspection=false
    -D os_type=redhat
    -D session_tracking=libsystemd-login
    -D tests=true
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r "$pkgdir"/{etc,usr/{bin,include,lib,share}}
}

# vim:set sw=2 sts=-1 et:
