# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

# This package is entirely based on https://gitlab.archlinux.org/archlinux/packaging/packages/glib-networking

pkgname=glib-networking-gnutls-openssl
pkgver=2.80.0
pkgrel=3
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
  gsettings-system-schemas
  libproxy
)
makedepends=(
  git
  gsettings-desktop-schemas
  meson
)
checkdepends=(ca-certificates)
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${pkgver/[a-z]/.&}")
b2sums=('819f574bd8e43e24e3e4c2248a44bb4882aa402c0c8c836b1d054b7d7da0d7f17428c64f8192185fa86575cf431ce895071b5ae22f26feea3c19ec7e5b74251d')

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
