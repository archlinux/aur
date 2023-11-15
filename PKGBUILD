# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname="g4music"
pkgname="$_pkgname-git"
pkgver=3.4.1.r2.g3b76f92
pkgrel=1
pkgdesc="Play your music"
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
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

pkgver() {
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  )

  echo "${_pkgver:?}"
}

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
