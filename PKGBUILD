# Maintainer: mapache <mastersuv@gmail.com>
pkgname=spawnhere
pkgver=0.2.1
pkgrel=1
pkgdesc="Draw a gesture on Hyprland, spawn a floating window exactly where you drew"
arch=('x86_64')
url="https://github.com/revmnds/spawnhere"
license=('MIT')
depends=(
  'hyprland'
  'wayland'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d685e5107166aafbd26c78383719e93438a54ad2e582a4156153b9d43e39cef8')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
