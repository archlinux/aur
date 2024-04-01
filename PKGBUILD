# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=audio-sharing
pkgver=0.2.4
pkgrel=1
pkgdesc="Share your computer audio"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/AudioSharing"
license=('GPL-3.0-or-later')
depends=('gst-rtsp-server' 'libadwaita')
makedepends=('cargo' 'git' 'meson')
source=("https://gitlab.gnome.org/World/AudioSharing/-/archive/$pkgver/AudioSharing-$pkgver.tar.gz")
sha256sums=('9d8eb56a92addc866c5ef6fe257e664f19cbf0282894cdb1163e6b70db83dc9d')

prepare() {
  cd "AudioSharing-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "AudioSharing-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
