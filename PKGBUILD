# Maintainer: Dustin Pilgrim
# Author: Dustin Pilgrim
# License: GPL-3.0-only

pkgname=stasis
pkgver=1.7.0
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('GPL-3.0-only' 'AGPL-3.0-only')

depends=('systemd' 'dbus' 'libinput' 'wayland')
makedepends=('cargo' 'rust')
optdepends=(
  'libnotify: desktop notifications'
  'pipewire: native audio and microphone detection via pw-dump'
  'pulseaudio: native audio and microphone detection via pactl (alternative to PipeWire)'
  'upower: laptop lid state and events'
)

conflicts=('stasis-git')
# GCC LTO objects from bundled SQLite cannot be linked by Rust's LLD.
# The upstream Cargo release profile still enables Rust LTO.
options=('!debug' '!lto')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('110218d1cd24db061ade4a5844fb5aaf96a78f46ba7897931653e1276f4f9036')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binary
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/stasis" "$pkgdir/usr/bin/stasis"

  # Application and tray icons
  for icon in stasis stasis-tray; do
    install -Dm644 "assets/$icon.png" \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/$icon.png"
  done

  # Source and linked game-discovery library licenses
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/AGPL-3.0-only.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES/AGPL-3.0-only.txt"
  install -Dm644 THIRD_PARTY.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"

  # Example configurations, including the lid grace-period example
  for example in examples/*.rune; do
    install -Dm644 "$example" \
      "$pkgdir/usr/share/doc/$pkgname/$example"
  done

  # Preserve the existing stable-package example path.
  install -Dm644 examples/stasis.rune \
    "$pkgdir/usr/share/stasis/examples/stasis.rune"

  # Manual pages
  install -Dm644 docs/man/stasis.1 "$pkgdir/usr/share/man/man1/stasis.1"
  install -Dm644 docs/man/stasis.5 "$pkgdir/usr/share/man/man5/stasis.5"

  # Daemon and optional tray systemd user units
  for service in packaging/systemd/user/*.service; do
    install -Dm644 "$service" \
      "$pkgdir/usr/lib/systemd/user/${service##*/}"
  done
}
