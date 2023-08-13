# Maintainer: tarball <bootctl@gmail.com>

pkgbase=narrowlink
pkgname=(
  "$pkgbase"
  "$pkgbase-gateway"
  "$pkgbase-agent"
  "$pkgbase-token-generator"
)
pkgver=0.1.2
pkgrel=2
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 armv7h aarch64)
makedepends=(cargo)

source=(
  "$pkgbase-$pkgver.tar.gz::https://github.com/narrowlink/narrowlink/archive/refs/tags/$pkgver.tar.gz"
  "$pkgbase.service.in"
)
sha256sums=('1a8698e95cc97adb463a11f7bc808d5a0b85b78bb6d0fb8c805234cc81f9fe4a'
            '2f596a79cac41bde25dd610d1aa1580509412556a8a0cb36c0e7226ea11b67db')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package_narrowlink() {
  license=(MPL2)
  depends=(glibc gcc-libs openssl)
  backup=("etc/$pkgbase/client.yaml")

  cd "$pkgbase-$pkgver"
  install -Dm600 client/sample_client.yaml "$pkgdir/etc/$pkgbase/client.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-gateway() {
  license=(AGPL3)
  depends=(glibc gcc-libs)
  backup=("etc/$pkgbase/gateway.yaml")

  sed "s/__NAME__/gateway/g" <"$pkgbase.service.in" >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgbase-$pkgver"
  install -Dm600 gateway/sample_gateway.yaml "$pkgdir/etc/$pkgbase/gateway.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-agent() {
  license=(MPL2)
  depends=(glibc gcc-libs openssl)
  backup=("etc/$pkgbase/agent.yaml")

  sed "s/__NAME__/agent/g" <"$pkgbase.service.in" >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgbase-$pkgver"
  install -Dm600 agent/sample_agent.yaml "$pkgdir/etc/$pkgbase/agent.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-token-generator() {
  license=(MPL2)
  depends=(glibc gcc-libs)
  backup=("etc/$pkgbase/token-generator.yaml")

  cd "$pkgbase-$pkgver"
  install -Dm600 token-generator/sample_token-generator.yaml "$pkgdir/etc/$pkgbase/token-generator.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
