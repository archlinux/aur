# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=123
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL)
depends=(
  lib32-glib2
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
_commit=fc8b07e71d99f88a29258cde99b913b44da1846d  # tags/123^0
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  multilib.diff
)
b2sums=('SKIP'
        '132e1817a9f7ea5a9a5776ce342f8928c11c3562e97b35583430bac2843c4e335a599a63570f75439cc0b12f2d1df9349b617ace732aa32b3a35dc885beb673f')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit

  # Fix post-install script with libs-only=true
  git apply -3 ../multilib.diff
}

build() {
  local meson_options=(
    --libdir=/usr/lib32
    -D introspection=false
    -D libs-only=true
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

  rm -r "$pkgdir"/{etc,usr/{include,lib,share}}
}

# vim:set sw=2 sts=-1 et:
