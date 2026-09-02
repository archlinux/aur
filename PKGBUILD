# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=hydebar
pkgver=0.1.3
pkgrel=1
pkgdesc="Status bar for Hyprland, themed by the HyDE desktop"
arch=('x86_64')
url="https://github.com/HyDE-Project/hydebar"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'libpulse'
  'pipewire'
  'wayland'
  'xkbcommon'
)
makedepends=(
  'cargo'
  'clang'
  'llvm'
  'pkg-config'
  'rust>=1.98'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/HyDE-Project/hydebar/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host：//p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 target/release/hydebar "$pkgdir/usr/bin/hydebar"

  # Install theme switch script
  install -Dm755 scripts/theme-switch "$pkgdir/usr/bin/hydebar-theme-switch"

  # Install D-Bus service file
  install -Dm644 assets/dbus/org.freedesktop.Notifications.service \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.Notifications.service"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install licenses
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}
