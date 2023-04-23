# Maintainer: Daniel Goß <developer@flashsystems.de>
pkgname=ukibak
pkgver=0.6.2
pkgrel=2
pkgdesc="Unified Kernel Image backup utitlity"
arch=('x86_64')
url="https://github.com/FlashSystems/ukibak"
license=('MIT')
groups=()
depends=()
makedepends=(cargo)
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/FlashSystems/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('0f84f63426b26d61f3aacacf34d17b54802188990c583331fb0e9a4e5174e422')

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

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0750 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "systemd/ukibak.service"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "systemd/ukibak.timer"
}
