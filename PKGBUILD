# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname="g4music"
pkgname="$_pkgname-git"
pkgver=3.7.2.r1.g01f7243
pkgrel=1
pkgdesc="Play your music"
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  gstreamer
  libadwaita
  taglib
  tracker3
)
makedepends=(
  git
  meson
  vala
)
checkdepends=(
  appstream-glib
)
optdepends=(
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build || true
}

package() {
  meson install -C build --destdir "${pkgdir:?}"
}
