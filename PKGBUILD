# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
pkgver=0.7.5
pkgrel=2
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://apps.gnome.org/Mousai"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'gst-plugins-good' 'gstreamer' 'libadwaita'
         'libpulse' 'libsoup3')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb36c00e89bb577a6b603d6f9a89e8f931de9bbce42dc24271dfd22160d746cc')

prepare() {
  cd "Mousai-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Mousai-$pkgver" build
  meson compile -C build
}

check() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
