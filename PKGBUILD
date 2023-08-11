# Maintainer: tarball <bootctl@gmail.com>

pkgname=(
  narrowlink
  narrowlink-gateway
  narrowlink-agent
  narrowlink-token-generator
)
pkgver=0.1.2
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 aarch64)
license=(AGPL3 MPL2)
makedepends=(cargo)
depends=(glibc gcc-libs openssl)

source=(
  "narrowlink-$pkgver.tar.gz::https://github.com/narrowlink/narrowlink/archive/refs/tags/$pkgver.tar.gz"
  narrowlink.service.in
)
sha256sums=('1a8698e95cc97adb463a11f7bc808d5a0b85b78bb6d0fb8c805234cc81f9fe4a'
            '2f596a79cac41bde25dd610d1aa1580509412556a8a0cb36c0e7226ea11b67db')

prepare() {
  cd "narrowlink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "narrowlink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "narrowlink-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package_narrowlink() {
  cd "narrowlink-$pkgver"
  install -Dm644 client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

package_narrowlink-gateway() {
  sed "s/__NAME__/gateway/g" <narrowlink.service.in >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm700 "$pkgdir/etc/narrowlink"

  cd "narrowlink-$pkgver"
  install -Dm644 gateway/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

package_narrowlink-agent() {
  sed "s/__NAME__/agent/g" <narrowlink.service.in >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -dm700 "$pkgdir/etc/narrowlink"

  cd "narrowlink-$pkgver"
  install -Dm644 agent/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

package_narrowlink-token-generator() {
  cd "narrowlink-$pkgver"
  install -Dm644 token-generator/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
