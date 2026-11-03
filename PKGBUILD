# Maintainer: mestik78 <mestik78@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=planify-git
_pkgname=planify
pkgver=4.20.0.r38.ga88ca81
pkgrel=1
options=(!debug)
pkgdesc="Task manager with Todoist, Nextcloud and CalDAV support designed for GNOME (Git version)"
arch=('x86_64' 'aarch64')
url="https://useplanify.com/"
license=('GPL-3.0-or-later')
depends=(
  cairo
  chrono
  dconf
  evolution-data-server
  glib2
  glibc
  gtk4
  gtksourceview5
  gxml
  hicolor-icon-theme
  icu
  json-glib
  libadwaita
  libgee
  libgoa
  libical
  libportal
  libportal-gtk4
  libsecret
  libsoup3
  libspelling
  pango
  sqlite
)
makedepends=(
  git
  meson
  vala
)
provides=('planify')
conflicts=('planify')
source=("$_pkgname::git+https://github.com/alainm23/planify.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  # core test needs installed GSettings schema
  meson test -C build --print-errorlogs --exclude io.github.alainm23.planify:core
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s io.github.alainm23.planify "$pkgdir/usr/bin/planify"
  ln -s io.github.alainm23.planify.cli "$pkgdir/usr/bin/planify-cli"
  ln -s io.github.alainm23.planify.quick-add "$pkgdir/usr/bin/planify-quick-add"
}
