# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>

pkgname=shikane
pkgver=0.2.0
pkgrel=1
pkgdesc="Dynamic output configuration tool for Wayland compositors"
arch=('x86_64')
url="https://gitlab.com/w0lff/shikane"
license=('MIT')
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('a5d91c1d946e17cf963428548b8eb7b36857afede26cf28145eaf1ece9c59ab43311b33da6da778ea8567a4c546f89efd0a58e2860ce0f26a2d43fd6b303763c')

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
