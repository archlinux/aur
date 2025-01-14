# Maintainer: envolution
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase=gsettings-desktop-schemas-git
pkgname=(
  gsettings-desktop-schemas-git
  gsettings-system-schemas-git
)
_pkgbase=gsettings-desktop-schemas
pkgver=48.alpha+r1770+gcc8c6237a
_pkgver=${pkgver%%+*}                                               #strip off git +part
_pkgver=$(echo "$_pkgver" | sed -E 's/(\.|^)[^0-9]+(\.|$)/\10\2/g') #replace non-numeric characters (rc, beta, alpha) with 0
pkgrel=2

pkgdesc="GSettings schemas for GNOME - git latest"
url="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
arch=(any)
license=(LGPL-2.1-or-later)
makedepends=(
  adobe-source-code-pro-fonts
  cantarell-fonts
  dconf
  git
  glib2-devel
  gobject-introspection
  meson
)

source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgbase
  _version=$(git describe --tags --abbrev=0 | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  arch-meson $_pkgbase build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gsettings-desktop-schemas-git() {
  provides+=(
    gsettings-desktop-schemas=$_pkgver
  )
  conflicts=(
    gsettings-desktop-schemas
  )
  pkgdesc+=" desktop components"
  depends=(
    "gsettings-system-schemas=$_pkgver"
    adobe-source-code-pro-fonts
    cantarell-fonts
    dconf
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"
  _pick system usr/share/glib-2.0/schemas/org.gnome.desktop.enums.xml
  _pick system usr/share/glib-2.0/schemas/org.gnome.system.*.gschema.xml
}

package_gsettings-system-schemas-git() {
  provides=(
    gsettings-system-schemas=$_pkgver
  )
  conflicts=(
    gsettings-system-schemas
  )
  pkgdesc+=" system components"
  depends=(dconf)

  mv system/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
