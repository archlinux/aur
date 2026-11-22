# Maintainer: tak0dan <200241398+tak0dan@users.noreply.github.com>
pkgname=windfall
pkgver=0.7.0
pkgrel=1
pkgdesc="Weather overlay for Hyprland, Plasma Wayland/X11 and Windows, with a GTK4 controller"
arch=('x86_64' 'aarch64')
url="https://github.com/tak0dan/windfall"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'libglvnd' 'wayland' 'xorg-xprop' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('ttf-jetbrains-mono: pixel-theme font fallback'
            'ttf-press-start-2p: authentic pixel font for the controller in pixel mode')
options=('!lto' '!debug')
install=windfall.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7db9fea1dfa8a38646e30256fd4e889fec267142ffaa35d15e11f570b2caf13c')

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
  install -Dm644 packaging/windfall-app.desktop "$pkgdir/usr/share/applications/windfall.desktop"
  install -Dm644 packaging/windfall-autostart.desktop "$pkgdir/etc/xdg/autostart/windfall.desktop"
  ln -s windfalld "$pkgdir/usr/bin/windfall"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
