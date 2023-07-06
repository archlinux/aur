# Maintainer: Oliver Nordbjerg <hi@notbjerg.me>

_pkgname=reth
pkgname=reth-git
pkgver=0.1.0.alpha.1.r208.g428a6dc2f
pkgrel=1
pkgdesc="A fast implementation of the Ethereum protocol in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/paradigmxyz/reth"
license=('MIT' 'APACHE')
depends=()
makedepends=('git' 'cargo' 'clang')
provides=('reth')
source=("git+https://github.com/paradigmxyz/reth.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd ${_pkgname}

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${_pkgname}

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --bin reth --frozen --profile maxperf --features jemalloc
}

package() {
  cd ${_pkgname}

  install -Dm755 "target/maxperf/reth" "$pkgdir/usr/bin/reth"

  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
