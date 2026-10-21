# Maintainer: luanrz <luanrz@qq.com>

_pkgname=gnome-shell-extension-app-folder-grid-dimensions
pkgname=$_pkgname-git
pkgver=20261021.4.db15549
pkgrel=1
pkgdesc='Customize the number of rows and columns in the GNOME app folder grid (git)'
arch=('any')
url='https://github.com/luanrz/gnome-shell-extension-app-folder-grid-dimensions'
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'glib2')

_uuid='app-folder-grid-dimensions@luanrz'
_schema='org.gnome.shell.extensions.app-folder-grid-dimensions'

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local commit_date count hash
  commit_date=$(/usr/bin/date -u -d "@$(git log -1 --format=%ct)" '+%Y%m%d')
  count=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short=7 HEAD)
  printf '%s.%s.%s' "$commit_date" "$count" "$hash"
}

check() {
  cd "$srcdir/$_pkgname"
  glib-compile-schemas --strict --dry-run schemas/
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -m644 extension.js prefs.js metadata.json \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  # Install the XML only; glib2's pacman hook compiles it system-wide. Do not
  # ship a local schemas/ directory without gschemas.compiled: getSettings()
  # would prefer it.
  install -Dm644 "schemas/$_schema.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/$_schema.gschema.xml"
}
