# Maintainer: Grey Christoforo <grey@christoforo.net>
pkgname=redis-json
#_commit_hash=91505b31fbbd5c4ff33cd7ef5a43f67ec2f162a7  # v2.4.2 tag
pkgver=2.4.2
pkgrel=1
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
#  git+https://github.com/RedisJSON/RedisJSON.git#commit=${_commit_hash}
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
  cargo build --frozen --release --all-features
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
