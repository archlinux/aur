# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=shortwave-git
pkgver=3.2.0.r0.g6fb4acd
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/de.haeckerfelix.Shortwave"
license=('GPL3')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gstreamer' 'libadwaita' 'libshumate')
makedepends=('cargo' 'git' 'meson' 'wayland-protocols')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://gitlab.gnome.org/World/Shortwave.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Shortwave"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Shortwave"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Shortwave build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
