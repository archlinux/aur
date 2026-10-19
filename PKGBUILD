# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname="extension-manager"
pkgname="$_pkgname-git"
pkgver=0.6.5.r280.g43a5460
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
url="https://github.com/mjakeman/extension-manager"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'glycin'
  'glycin-gtk4'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libsoup3'
  'libxml2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
)
checkdepends=('appstream-glib')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _meson_options=(
    -Dbacktrace=false
    -Dpackage='pacman'
    -Ddistributor='aur'
  )
  arch-meson "${_meson_options[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
