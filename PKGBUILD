# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

# This package is entirely based on https://gitlab.archlinux.org/archlinux/packaging/packages/glib-networking

pkgname=glib-networking-gnutls-openssl
pkgver=2.80.0
pkgrel=1
epoch=1
pkgdesc="Network extensions for GLib with both GnuTLS and OpenSSL enabled"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64)
license=(LGPL-2.1-or-later)
provides=('glib-networking')
conflicts=('glib-networking')
depends=(
  glib2
  glibc
  gnutls
  openssl
  gsettings-desktop-schemas
  libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(ca-certificates)
_commit=3ae624d21b586ec33543004b037fd343042cb04b  # tags/2.80.0^0
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd glib-networking
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib-networking
}

build() {
  local meson_options=(
    -D gnutls=enabled
    -D openssl=enabled
  )

  arch-meson glib-networking build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -vC build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
