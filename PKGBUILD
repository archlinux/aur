# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide
pkgver=0.11.3
pkgrel=1
pkgdesc="Cross-platform terminal IDE, file manager and virtual terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/termide/termide/archive/$pkgver.tar.gz")
sha256sums=('83574ac61633c10994a6d1dde321080d67d88be256b8d5f8162c5d1c4b201db8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install help files
    install -Dm644 help/en.txt "$pkgdir/usr/share/$pkgname/help/en.txt"
    install -Dm644 help/ru.txt "$pkgdir/usr/share/$pkgname/help/ru.txt"
}
