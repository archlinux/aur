# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=limbo
pkgver=0.0.12
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
makedepends=(cargo mimalloc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tursodatabase/limbo/releases/download/v$pkgver/source.tar.gz")
sha256sums=('81612956460145bd21467d43311a2b7af523507233229e40e74150b07dd689e4')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS='-l mimalloc'
    cargo build --frozen --release -p limbo
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
