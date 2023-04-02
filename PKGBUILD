# Maintainer: Maya Matuszczyk <maccraft123mc@gmail.com>
pkgname=ayaled
pkgver=0.2.0
pkgrel=1
pkgdesc="A daemon to manage joystick LEDs on AYANEO devices"
url="https://github.com/Maccraft123/ayaled"
arch=('x86_64')
license=('custom')
makedepends=('cargo')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Maccraft123/ayaled/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('3f6d30b27ebf69c8b07a7796dee41ee9d1c1d5258194d35ecf9195923bf06a70')

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

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m755 "src/ayaled.service" "$pkgdir/etc/systemd/system/ayaled.service"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
