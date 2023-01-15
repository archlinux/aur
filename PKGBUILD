# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=122
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
_commit=da87c5698019897dd731bb2cbb54ebd9c9481f52  # tags/122
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  multilib.diff
)
b2sums=('SKIP'
        '9b588509dae8528bfb8aa3cb734bf79b194350587d763ed70fa8e91a1a9fe54bb6cef352e13e31560f3b4ad418157111eb3e2678ae5dd84f052e4dcd9cde53c9')

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
