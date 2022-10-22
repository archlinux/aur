# Maintainer: Jake Barnes <me+aur@jakebarn.es>
pkgname=liblivesplit-core
pkgver=0.12.0
pkgrel=2
pkgdesc="a library that provides a lot of functionality for creating a speedrun timer"
arch=('x86_64')
url="https://github.com/LiveSplit/livesplit-core"
license=('Apache-2.0/MIT')
makedepends=(cargo)
source=("https://github.com/LiveSplit/livesplit-core/archive/refs/tags/v$pkgver.tar.gz"
        "livesplit_core.pc")
sha1sums=('4fc83710c5fb80b256fa870fa4b4c0959cdbbb0a'
          'SKIP')

prepare() {
  cd "livesplit-core-${pkgver}"
  # can't use --locked currently
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  cd "capi/bind_gen"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "livesplit-core-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo rustc --frozen --release -p livesplit-core-capi --crate-type cdylib
  cd "capi/bind_gen"
  cargo run
}

check() {
  cd "livesplit-core-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm644 "livesplit-core-${pkgver}/capi/bindings/livesplit_core.h" "$pkgdir/usr/include/livesplit_core.h"
  install -Dm755 "livesplit-core-${pkgver}/target/release/liblivesplit_core_capi.so" "$pkgdir/usr/lib/liblivesplit_core.so"
  install -Dm644 livesplit_core.pc "$pkgdir/usr/lib/pkgconfig/livesplit_core.pc"
}
