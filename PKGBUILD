# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=shikane
pkgver=0.1.2
pkgrel=1
pkgdesc="Dynamic output configuration tool for Wayland compositors"
arch=('x86_64')
url="https://gitlab.com/w0lff/shikane"
license=('MIT')
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('da2e2654468d1e79e53b44ce459e6d4ae3547d9d2f9a039d539956be69e30cc378c7df20e32fa449a273551170a1bb92402baa344589c5dc4da5c6567b7d75c5')

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
