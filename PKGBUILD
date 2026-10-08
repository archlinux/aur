# Maintainer: Dustin Pilgrim
# Author: Dustin Pilgrim
# License: GPL-3.0-only

pkgname=stasis-git
pkgver=1.6.3.r15.g820ea3b
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness (git version)"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('GPL-3.0-only' 'AGPL-3.0-only')

depends=('systemd' 'dbus' 'libinput' 'wayland')
makedepends=('git' 'cargo' 'rust')
optdepends=(
  'libnotify: desktop notifications'
  'pipewire: native audio and microphone detection via pw-dump'
  'pulseaudio: native audio and microphone detection via pactl (alternative to PipeWire)'
  'upower: laptop lid state and events'
)

provides=('stasis')
conflicts=('stasis')
# GCC LTO objects from bundled SQLite cannot be linked by Rust's LLD.
# The upstream Cargo release profile still enables Rust LTO.
options=('!debug' '!lto')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/stasis"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/stasis"
  cargo build --release --locked
}

package() {
  cd "$srcdir/stasis"

  # Binary
  install -Dm755 "target/release/stasis" "$pkgdir/usr/bin/stasis"

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

  # Manual pages
  install -Dm644 docs/man/stasis.1 "$pkgdir/usr/share/man/man1/stasis.1"
  install -Dm644 docs/man/stasis.5 "$pkgdir/usr/share/man/man5/stasis.5"

  # Daemon and optional tray systemd user units
  for service in packaging/systemd/user/*.service; do
    install -Dm644 "$service" \
      "$pkgdir/usr/lib/systemd/user/${service##*/}"
  done
}
