# Maintainer: Faynot <faynotdev@gmail.com>
pkgname=dumbshot
pkgver=0.2.0
pkgrel=2
pkgdesc="An elegant, painless one-click screenshot utility for Wayland (grim + slurp)"
arch=('x86_64')
url="https://github.com/Faynot/dumbshot"
license=('MIT')
depends=(
  'grim'
  'slurp'
  'wl-clipboard'
  'libnotify'
  'eww'
  'hyprland'
  'xdg-utils'
)
makedepends=(
  'rust'
  'cargo'
)
optdepends=(
  'satty: Screenshot annotation editor'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Faynot/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('02fcedad690a570a36363e12ea870159e04e6207a380fb452d20459a38c58c75')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Установка лицензии (если есть файл LICENSE)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
