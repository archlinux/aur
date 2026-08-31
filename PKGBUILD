# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=halley
pkgver=0.7.0
pkgrel=1
pkgdesc="Spatial Wayland compositor built around infinite workspace navigation"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-only')
depends=(
  'wayland'
  'libxkbcommon'
  'libinput'
  'seatd'
  'mesa'
  'libdisplay-info'
  'libdrm'
)
makedepends=(
  'rust'
  'cargo'
  'pkgconf'
)
optdepends=(
  'halley-lift: native search and action launcher'
  'xdg-desktop-portal-halley: native ScreenCast/Screenshot portal backend'
  'xorg-xwayland: X11 application support'
  'xdg-desktop-portal-gtk: fallback backend for common file/dialog portals'
  'fuzzel: alternative launcher'
  'ghostty: terminal for the default-terminal binding'
  'kitty: terminal for the default-terminal binding'
  'foot: terminal for the default-terminal binding'
  'wezterm: terminal for the default-terminal binding'
  'alacritty: terminal for the default-terminal binding'
  'wireplumber: provides wpctl for default media-key bindings'
)
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/halley/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b35f12742dabb31e4ff6d8ecd5098e46f834b6f20a69157b26149a8a790fd89e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley -p halley-cli
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked -p halley-cli --no-fail-fast || true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/halley" \
    "$pkgdir/usr/bin/halley"

  install -Dm755 "target/release/halleyctl" \
    "$pkgdir/usr/bin/halleyctl"

  install -Dm755 "packaging/wayland-sessions/halley-session" \
    "$pkgdir/usr/bin/halley-session"

  install -Dm644 "packaging/wayland-sessions/halley.desktop" \
    "$pkgdir/usr/share/wayland-sessions/halley.desktop"

  install -Dm644 "packaging/systemd-user/halley.service" \
    "$pkgdir/usr/lib/systemd/user/halley.service"

  install -Dm644 "packaging/systemd-user/halley-shutdown.target" \
    "$pkgdir/usr/lib/systemd/user/halley-shutdown.target"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
