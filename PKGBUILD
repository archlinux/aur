# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka
pkgver=0.1.4
pkgrel=1
pkgdesc="A front-end for libalpm, inspired by nala"
url="https://github.com/Shisones/Waka"
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'pacman')
optdepends=('curl: for waka fetch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8e3d730f49e154f558a74d87673ad4fca73cbc634e6484e12d9a187d57c50ed')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir"
    mv "Waka-$pkgver" "$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
