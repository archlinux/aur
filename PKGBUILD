# Maintainer: Zdeněk Biberle <zdenek at biberle dot net>
pkgname=snx-rs
pkgver=0.8.3
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
sha256sums=('7159aa1a7eb2e6399f2c4a5eabc8a3980fc42b088dc0a3c5b422335590159b07'
            'c4438f1167b76cc278610faacdd6d821e21a9339dd12fd86bf5c27f6af66424d')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/fix-executable-path.patch"
  export RUSTUP_TOOLCHAIN=stable
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
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{snx-rs,snxctl}
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" assets/snx-rs.service
}
