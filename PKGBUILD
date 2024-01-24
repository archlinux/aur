# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>

pkgname=reth
pkgver=v0.1.0_alpha.16
_tag=v0.1.0-alpha.16
pkgrel=1
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
depends=()
makedepends=('git' 'cargo' 'clang')
provides=('reth')
source=("git+https://github.com/paradigmxyz/reth.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
    cd ${pkgname}

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --bin reth --frozen --profile maxperf --features jemalloc
}

package() {
  cd ${pkgname}

  install -Dm755 "target/maxperf/reth" "$pkgdir/usr/bin/reth"

  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
