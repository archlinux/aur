pkgname=halley
pkgver=0.4.0
pkgrel=1
pkgdesc="Spatial Wayland compositor built around infinite workspace navigation"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-or-later')
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
  'xwayland-satellite: X11 application support'
  'fuzzel: launcher bound to Super+d by default'
  'ghostty: terminal for the default open-terminal binding'
  'kitty: terminal for the default open-terminal binding'
  'foot: terminal for the default open-terminal binding'
  'wezterm: terminal for the default open-terminal binding'
  'alacritty: terminal for the default open-terminal binding'
  'wireplumber: provides wpctl for default media-key bindings'
  'gamescope: game launch wrapping through halleyctl gamescope'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/halley/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55808ec46ae308755829451557406626f8a3c6d631ed300684d1e0424821f5a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley -p halley-cli -p halley-lens
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

  install -Dm755 "target/release/halley-lens" \
    "$pkgdir/usr/bin/halley-lens"

  install -Dm755 "packaging/wayland-sessions/halley-session" \
    "$pkgdir/usr/bin/halley-session"

  install -Dm644 "packaging/wayland-sessions/halley.desktop" \
    "$pkgdir/usr/share/wayland-sessions/halley.desktop"

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
