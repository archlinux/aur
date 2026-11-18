# Maintainer: Yangtse Su <yangtsesu at gmail dot com>
# Upstream: https://github.com/YangtseSu/nfc-foundry

pkgname=nfc-foundry
pkgver=0.3.0
pkgrel=1
pkgdesc='NFC reader workbench for MIFARE Classic and NFC Forum Type 2/NDEF cards'
arch=('x86_64')
url='https://github.com/YangtseSu/nfc-foundry'
license=('GPL-3.0-or-later')
# Runtime libraries: glibc, glib2, libgcc, libudev (systemd-libs), libpcsclite,
# GTK4, and libadwaita.
depends=(
  glibc
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  libgcc
  pcsclite
  systemd-libs
)
makedepends=(
  cargo
  git
  pkgconf
  rust
)
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
# Cargo's release profile owns Rust LTO. Disable makepkg's C LTO flags so the
# wayland-backend log shim stays a plain object for the final link.
options=('!debug' '!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$PWD=/build/nfc-foundry"
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/build/cargo"
  cargo build --release --locked --offline --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --workspace --offline
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/nfctl "$pkgdir/usr/bin/nfctl"
  install -Dm755 target/release/nfc-foundry "$pkgdir/usr/bin/nfc-foundry"
  install -Dm644 resources/nfc-foundry.desktop \
    "$pkgdir/usr/share/applications/nfc-foundry.desktop"
  install -Dm644 resources/icons/nfc-foundry.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/nfc-foundry.svg"
  install -Dm644 resources/icons/nfc-foundry-128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/nfc-foundry.png"
  install -Dm644 resources/icons/nfc-foundry-256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nfc-foundry.png"
  install -Dm644 resources/icons/nfc-foundry-512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/nfc-foundry.png"
  install -Dm644 resources/udev/70-nfc-foundry.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-nfc-foundry.rules"

  install -d "$pkgdir/usr/share/nfc-foundry"
  cp -a resources/hardnested_tables "$pkgdir/usr/share/nfc-foundry/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/GPL-3.0-or-later.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES/GPL-3.0-or-later.txt"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 THIRD_PARTY_NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}

# vim:set ts=2 sw=2 et:
