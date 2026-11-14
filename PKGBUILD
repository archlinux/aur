# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage
pkgver=0.2.1
pkgrel=1
pkgdesc="Blazing fast usage reports for coding agents - a Rust rewrite of ccusage"
arch=('x86_64' 'aarch64')
url="https://github.com/Coobyk/rsusage"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('rsusage-bin')
# makepkg's lto option produces GCC LTO objects in bundled C deps
# (mimalloc/sqlite) that rust-lld cannot read -> undefined mi_* symbols
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56590d88e06aa02ede91b859892124b482f1be45fd541f4c900663c5221cf1ab')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rsusage" "$pkgdir/usr/bin/rsusage"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
