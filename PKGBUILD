# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=shikane
pkgver=1.0.1
pkgrel=1
pkgdesc="deterministic dynamic output configuration tool for Wayland compositors"
arch=('x86_64')
url="https://gitlab.com/w0lff/shikane"
license=('MIT')
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('55e1038390c547003d2e048aa678155ceb36c4cfcd216d3aefbc798832f9c7abfe386704fb6233279c5fcc3c7d64d05d50f1ddf110b72cfae8c1f2bd80379189')

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
