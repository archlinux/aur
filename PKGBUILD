# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage
pkgver=0.1.r10
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
sha256sums=('16554a32ed9391a34148313d54848f45d645a7d88341737ca461a0ef41cfa53c')

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
