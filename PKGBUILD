# Maintainer: Faynot <faynotdev@gmail.com>
pkgname=dumbshot
pkgver=0.1.0
pkgrel=1
pkgdesc="An elegant, painless one-click screenshot utility for Wayland (grim + slurp)"
arch=('x86_64')
url="https://github.com/Faynot/dumbshot"
license=('MIT')
depends=('grim' 'slurp' 'wl-clipboard' 'libnotify')
makedepends=('rust' 'cargo')
optdepends=(
    'wofi: Рекомендуемый GUI для выбора действий'
    'rofi: Альтернативный GUI'
    'dmenu: Минималистичный GUI'
    'satty: Для редактирования скриншотов'
    'hyprland: Для автоматического определения мониторов через hyprctl'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Faynot/$pkgname/archive/v$pkgver.tar.gz") # If you are ripping off the web
# If you are compiling locally, replace source with:
# source=("local_files")

sha256sums=('62ed6b0d894903399904f536492e0080b705e7d2453f12617df4b0c730553b7b')

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
