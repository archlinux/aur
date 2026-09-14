# Maintainer: Daan Hessen <daanh2002@gmail.com>

pkgname=lumend
pkgver=0.1.0
pkgrel=3
pkgdesc="Adaptive screen brightness for Wayland laptops without a light sensor"
arch=('x86_64' 'aarch64')
url="https://github.com/DaanHessen/lumend"
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo')
optdepends=(
  'hyprland: window, fullscreen, idle and screen content signals'
  'hyprsunset: night light awareness'
  'iwd: network signal'
  'networkmanager: network signal'
)
options=('!lto')
conflicts=('lumend-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f657edfca1340b97c9c8540109e29073c927f9def4b9a1106c8a08c581a41c27')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" dist/lumend.service
  install -Dm0644 dist/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md docs/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
