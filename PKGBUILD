# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide
pkgver=0.35.0
pkgrel=1
pkgdesc="Cross-platform terminal IDE, file manager and virtual terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/termide/termide/archive/$pkgver.tar.gz")
sha256sums=('7f5603bf2315ae8d7418c081c3cdccbc564ff6df0836239ec796b0d553370274')

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

    # Install shell completions
    install -Dm644 completions/termide.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/_termide "$pkgdir/usr/share/zsh/site-functions/_termide"
    install -Dm644 completions/termide.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
