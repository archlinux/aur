# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.9.1
pkgrel=2
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/io.bassi.Amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
_commit=2b2fc127f63acf69f795b657d4721188bd5d145e  # tags/0.9.1^0
source=("git+https://gitlab.gnome.org/World/amberol.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  local meson_options=(
    --buildtype release
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
