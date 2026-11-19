# Maintainer: tak0dan <200241398+tak0dan@users.noreply.github.com>
pkgname=windfall
pkgver=0.4.0
pkgrel=1
pkgdesc="Weather overlay for Hyprland: snow, leaves, petals and rain fall and pile up, flowers grow where they land (tray icon, GTK4 controller, pixel-art mode)"
arch=('x86_64' 'aarch64')
url="https://github.com/tak0dan/windfall"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'libglvnd' 'wayland' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('ttf-jetbrains-mono: pixel-theme font fallback'
            'ttf-press-start-2p: authentic pixel font for the controller in pixel mode')
options=('!lto' '!debug')
install=windfall.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('742fe13b877ffaef7b1f719da40f1ca13465e4cbfc447634df9b187aac927e96')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
  cargo test --frozen --release -p windfall-core
}

package() {
  cd "$pkgname-$pkgver"
  for b in windfalld windfallctl windfall-gui; do
    install -Dm755 "target/release/$b" "$pkgdir/usr/bin/$b"
  done
  install -Dm644 packaging/windfall-controller.desktop "$pkgdir/usr/share/applications/io.github.tak0dan.Windfall.desktop"
  install -Dm644 packaging/windfall.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/windfall.svg"
  install -Dm644 packaging/windfalld-autostart.desktop "$pkgdir/etc/xdg/autostart/windfalld.desktop"
  install -Dm644 packaging/windfalld.service "$pkgdir/usr/lib/systemd/user/windfalld.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
