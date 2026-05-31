pkgname=halley
pkgver=0.3.2
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
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/halley/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('810e4151e1c22804a0d5504fee626b8f0dc21b6a92657431247333fd2dfa6fdd')

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

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
