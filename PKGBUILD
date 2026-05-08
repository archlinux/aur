# Maintainer: fluhus
# Based on Arch's gnome-online-accounts PKGBUILD by Jan Alexander Steffens, Fabian Bornschein, Ionut Biru

pkgname=gnome-online-accounts-googledrive
pkgver=3.58.1
pkgrel=2
pkgdesc="Single sign-on framework for GNOME (with Google Files provider enabled)"
url="https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/wikis/home"
arch=(x86_64 aarch64)
license=(LGPL-2.0-or-later)
depends=(
  dbus
  dconf
  gcr-4
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  json-glib
  keyutils
  krb5
  libadwaita
  libgcc
  librest
  libsecret
  libsoup3
  libxml2
)
makedepends=(
  git
  gi-docgen
  glib2-devel
  gobject-introspection
  meson
  vala
)
optdepends=(
  'epiphany: (or another modern browser): OAuth authentication'
  'gvfs-goa: Virtual file systems, e.g. OwnCloud'
  'gvfs-onedrive: Microsoft OneDrive'
  'gvfs-googledrive: Google Drive support'
)
provides=(
  "gnome-online-accounts=$pkgver"
  "libgoa=$pkgver"
  "libgoa-docs=$pkgver"
  libgoa-1.0.so
  libgoa-backend-1.0.so
)
conflicts=(gnome-online-accounts libgoa libgoa-docs)
replaces=(gnome-online-accounts libgoa libgoa-docs)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-online-accounts.git#tag=$pkgver"
)
b2sums=('602f36235a44052e0a0b7feea7574f659144bb70f4f97b50c6d020927b6d153290cc0396d38265d20f36a2c2d8f920817c187ef6584279623935c3c9ed74ea8e')

prepare() {
  cd gnome-online-accounts
}

build() {
  local meson_options=(
    -D documentation=true
    -D man=true
    -D google_files=true
  )

  arch-meson gnome-online-accounts build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
