# Maintainer: Grey Christoforo <grey@christoforo.net>
pkgname=redis-json
pkgver=2.4.2
pkgrel=2
pkgdesc="A JSON data type for Redis"
arch=(x86_64)
url="https://redis.io/docs/stack/json/"
license=('custom:RSALv2' 'custom:SSPLv1')
depends=(
redis
)
makedepends=(
git
cargo
clang
)

source=(
${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/RedisJSON/RedisJSON/tar.gz/refs/tags/v${pkgver}
)

sha256sums=('3db95e4a270c2de221d266c6476d1e096354150e77f1ee6ff8be57cc4f2e3c77')

prepare() {
  cd RedisJSON-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd RedisJSON-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd RedisJSON-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd RedisJSON-${pkgver}
  install -D target/release/librejson.so --target-directory ${pkgdir}/usr/lib/redis
  install -Dm644 licenses/* --target-directory ${pkgdir}/usr/share/licenses/${pkgname}
}
