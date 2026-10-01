# Maintainer: Sean Snell <ssnell@lakecs.net>
pkgname=cw-chat
pkgver=0.2.0
pkgrel=1
pkgdesc="CW (Morse code) chat over PipeWire: send typed text and decode received CW in a GTK window"
arch=('x86_64' 'aarch64')
url="https://github.com/dhtseany/cw-chat"
license=('GPL-3.0-or-later')
depends=('glib2' 'glibc' 'graphene' 'gtk4' 'libadwaita' 'libgcc' 'libpipewire' 'pango')
optdepends=('pipewire: the PipeWire audio server the TX and RX nodes connect to'
            'qpwgraph: routing the TX and RX nodes by hand'
            'smc-bridge-hrdctl: keying the radio through Ham Radio Deluxe (--ptt hrdctl)')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dhtseany/cw-chat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c90392df0cdea25d4727ac472bda5124aec22bf6eec6a866df5b55a1c45465a6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/cw-chat "$pkgdir/usr/bin/cw-chat"
  install -Dm644 net.cwchat.CwChat.desktop "$pkgdir/usr/share/applications/net.cwchat.CwChat.desktop"
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/net.cwchat.CwChat-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/net.cwchat.CwChat.png"
  done
  install -Dm644 assets/icons/net.cwchat.CwChat.png "$pkgdir/usr/share/pixmaps/net.cwchat.CwChat.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
