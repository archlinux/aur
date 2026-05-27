# Maintainer: Adrien Plagnol <adrien.plagnol@believe.com>
pkgname=rustiferin
pkgver=0.2.0
pkgrel=1
pkgdesc='Rust ambient-lighting agent for Glow Worm Luciferin (Plasma Wayland + MQTT)'
url='https://github.com/dalsh/rustiferin'
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('pipewire' 'glibc')
makedepends=('cargo' 'pkgconf')
optdepends=('mosquitto: local MQTT broker if you do not have one elsewhere on the LAN')
# !lto: aws-lc-sys's cmake build inherits -flto from CFLAGS when makepkg's
# default LTO option is on; the resulting .a is LLVM bitcode and rust-lld
# fails to resolve aws_lc_0_*_* symbols at the final link.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d4d8c4a87d9fe6ee62eeb8adcae42425949430f0480a40d689b79c36a5da87f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rustiferin   "$pkgdir/usr/bin/rustiferin"
  install -Dm644 dist/rustiferin.service     "$pkgdir/usr/lib/systemd/user/rustiferin.service"
  install -Dm644 dist/rustiferin.desktop     "$pkgdir/usr/share/applications/rustiferin.desktop"
  install -Dm644 dist/config.example.yaml    "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"
  install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # AUR installs land the binary at /usr/bin; rewrite the default cargo-install
  # path so `systemctl --user enable --now rustiferin` works out of the box.
  sed -i 's|%h/.cargo/bin/rustiferin|/usr/bin/rustiferin|' \
    "$pkgdir/usr/lib/systemd/user/rustiferin.service"
}
