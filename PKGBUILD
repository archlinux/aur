# Maintainer: tarball <bootctl@gmail.com>

pkgbase=narrowlink
pkgname=(
  "$pkgbase"
  "$pkgbase-gateway"
  "$pkgbase-agent"
  "$pkgbase-token-generator"
)
pkgver=0.2.1
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 armv7h aarch64)
makedepends=(cargo)
depends=(glibc gcc-libs)

source=(
  "$pkgbase-$pkgver.tar.gz::https://github.com/narrowlink/narrowlink/archive/refs/tags/$pkgver.tar.gz"
  "$pkgbase.service.in"
)
sha256sums=('b2e2a0b8481431e16f3133262c699d47ada45a8b7f72fd160160b46bca1f14f1'
            '5248b868c9a6f42fdf7c392525bbe238b54ff564fb0d59999d5af4b8d0aa84aa')

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
  backup=("etc/$pkgbase/client.yaml")

  cd "$pkgbase-$pkgver"
  install -Dm600 client/sample_client.yaml "$pkgdir/etc/$pkgbase/client.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-gateway() {
  license=(AGPL3)
  backup=("etc/$pkgbase/gateway.yaml")

  sed "s/__NAME__/gateway/g" <"$pkgbase.service.in" >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgbase-$pkgver"
  install -Dm600 gateway/sample_gateway.yaml "$pkgdir/etc/$pkgbase/gateway.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-agent() {
  license=(MPL2)
  backup=("etc/$pkgbase/agent.yaml")

  sed "s/__NAME__/agent/g" <"$pkgbase.service.in" >"$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgbase-$pkgver"
  install -Dm600 agent/sample_agent.yaml "$pkgdir/etc/$pkgbase/agent.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

package_narrowlink-token-generator() {
  license=(MPL2)
  backup=("etc/$pkgbase/token-generator.yaml")

  cd "$pkgbase-$pkgver"
  install -Dm600 token-generator/sample_token-generator.yaml "$pkgdir/etc/$pkgbase/token-generator.yaml"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
