# Maintainer: Zdeněk Biberle <zdenek at biberle dot net>
pkgname=snx-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Rust client for Checkpoint VPN tunnels"
arch=(x86_64)
url=https://github.com/ancwrd1/snx-rs
license=(AGPL-3.0)
depends=(gcc-libs glibc openssl systemd iproute2)
makedepends=(cargo)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ancwrd1/$pkgname/archive/refs/tags/$pkgver.tar.gz"
  fix-executable-path.patch
)
sha256sums=('3226a25201ab39ed0ade2d59093b77f56b42454075a642625ffbccc507103ad5'
            'c4438f1167b76cc278610faacdd6d821e21a9339dd12fd86bf5c27f6af66424d')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/fix-executable-path.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features tray-icon
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --features tray-icon
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{snx-rs,snxctl}
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" assets/snx-rs.service
}
