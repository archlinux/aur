# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

_name=gnome-commander
pkgname=$_name-git
pkgver=1.19.0.r6473.18a899c
pkgrel=1
pkgdesc="Graphical two-pane filemanager for GNOME"
arch=('x86_64')
url="https://gcmd.github.io"
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  exiv2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgsf
  pango
  poppler-glib
  taglib
)
makedepends=(
  appstream
  git
  glib2-devel
  gtest
  itstool
  meson
  smbclient
  rust
)
checkdepends=(xorg-server-xvfb)
provides=($_name)
conflicts=($_name)
source=("git+https://gitlab.gnome.org/GNOME/gnome-commander.git")
b2sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep -Po "^\s+version: '[\d+\.]+\d+'," meson.build | cut -d\' -f2)
  r=$(git rev-list --count HEAD)
  h=$(git rev-parse --short=7 HEAD)
  printf "$v.r$r.$h"
}

build() {
  arch-meson $_name build
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
