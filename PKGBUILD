# Maintainer: Mateusz Kiersnowski <mateusz.kiersnowski@gmail.com>
pkgname=yubihsm-manager
pkgver=1.0.0
pkgrel=1
pkgdesc='Command line tool for YubiHSM 2'
arch=(x86_64)
url='https://github.com/Yubico/yubihsm-manager'
license=(Apache-2.0)
depends=(gcc-libs glibc libyubihsm openssl)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yubico/yubihsm-manager/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cd9b077d18863680c0ef3cee93b0b3b6d5f50869b2e3760aa251d661c4421fed')

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
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/yubihsm-manager "$pkgdir/usr/bin/yubihsm-manager"
}
