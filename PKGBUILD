# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=shikane
pkgver=1.0.0
pkgrel=1
pkgdesc="deterministic dynamic output configuration tool for Wayland compositors"
arch=('x86_64')
url="https://gitlab.com/w0lff/shikane"
license=('MIT')
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('490e730f9028e2341bed9e62ca743f28e6e525d0dbb4b72b3c719d6c1e9770abb5060ce03504d99d2e3e7a360ab8c82a7eb7b3e536234c3b9c65904f10f33477')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

    # build man pages
    ./scripts/build-docs.sh man
    ./scripts/build-docs.sh html
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/shikane "$pkgdir/usr/bin/shikane"
    install -Dm755 target/release/shikanectl "$pkgdir/usr/bin/shikanectl"
    install -Dm644 build/man/shikane.1.gz "$pkgdir/usr/share/man/man1/shikane.1.gz"
    install -Dm644 build/man/shikane.5.gz "$pkgdir/usr/share/man/man5/shikane.5.gz"
    install -Dm644 build/man/shikanectl.1.gz "$pkgdir/usr/share/man/man1/shikanectl.1.gz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/html/" build/html/*
}
