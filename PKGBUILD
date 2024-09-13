# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname="extension-manager"
pkgname="$_pkgname-git"
pkgver=0.5.1.r121.g74f8bd9
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
url="https://github.com/mjakeman/extension-manager"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'json-glib'
  'libadwaita'
  'libsoup3'
  'text-engine-git' # AUR
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
