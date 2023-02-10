# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=shikane
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic output configuration tool for Wayland compositors"
arch=('x86_64')
url="https://gitlab.com/w0lff/shikane"
license=('MIT')
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('b7727bd9387e1368b4748f43936a786092669c61febc97c6120615cd9d960a64e8b003f6e1a342aa6202f8dbebc7b805c1808f8c8e3423949e60438a18161a75')

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
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/shikane"
    install -Dm644 build/shikane.1.gz "$pkgdir/usr/share/man/man1/shikane.1.gz"
    install -Dm644 build/shikane.5.gz "$pkgdir/usr/share/man/man5/shikane.5.gz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
