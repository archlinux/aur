# Maintainer: envolution
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-session-git
_pkgname=gnome-session
pkgver=47.0.1+r6768+g39ef6f6c9
pkgrel=1
pkgdesc="The GNOME Session Handler - git latest"
url="https://gitlab.gnome.org/GNOME/gnome-session"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  bash
  dconf
  gcc-libs
  glib2
  glibc
  gnome-desktop
  gnome-keyring
  gsettings-desktop-schemas
  gtk3
  json-glib
  libepoxy
  libgl
  libice
  libsm
  libx11
  libxcomposite
  libxtst
  systemd
  systemd-libs
  xdg-desktop-portal-gnome
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gtk-doc
  mesa
  meson
  python
  xmlto
  xtrans
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/gnome-session.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname

  _version=$(git describe --tags --abbrev=0)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  [ -d build ] && rm -rf build
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
