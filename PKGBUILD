# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=audio-sharing
pkgver=0.2.2
pkgrel=1
pkgdesc="Share your computer audio"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/AudioSharing"
license=('GPL-3.0-or-later')
depends=('gst-rtsp-server' 'libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/World/AudioSharing/-/archive/$pkgver/AudioSharing-$pkgver.tar.gz")
sha256sums=('baebdefb33329b81a9f5aa68f4b906453625256e90e0df963ed164220a71cb1a')

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
