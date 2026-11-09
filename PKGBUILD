# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka
pkgver=0.1.7
pkgrel=2
pkgdesc="A front-end for libalpm, inspired by nala"
url="https://github.com/Shisones/Waka"
license=('GPL-3.0-only')
arch=('x86_64')
options=('!debug')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'pacman')
optdepends=('curl: for waka fetch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4ebf71396bd91ffb9af57d9b4b07a883af2f04012767c876b752ec1b12defac')

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
    export NO_COLOR=1
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
