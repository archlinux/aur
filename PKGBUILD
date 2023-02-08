# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=shortwave
pkgver=3.2.0
pkgrel=1
epoch=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-libav')
makedepends=('git' 'meson' 'cargo' 'wayland-protocols')
checkdepends=('appstream-glib')
_commit=6fb4acd47a4eae422270f9543bce2d5f0037504c # tags/3.2.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
options=('!lto')
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
