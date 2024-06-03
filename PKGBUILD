# Maintainer:
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

## useful links
# https://wiki.gnome.org/Apps/Contacts
# https://gitlab.gnome.org/GNOME/gnome-contacts

_pkgname="gnome-contacts"
pkgname="$_pkgname-git"
pkgver=46.0.r15.g4ec2661
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-contacts"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  evolution-data-server
  folks
  gnome-online-accounts
  gtk4
  libadwaita
  libgee
  libportal-gtk4
  qrencode
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
  vala
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
