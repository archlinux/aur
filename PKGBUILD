# Maintainer: Nathaniel Fargo <nathaniel.fargo@gmail.com>
pkgname=monitui
pkgver=0.2.3
pkgrel=1
pkgdesc="A delightfully minimal TUI for wrangling Hyprland monitors"
arch=('x86_64')
url="https://github.com/nathaniel-fargo/monitui"
license=('MIT')
depends=('gcc-libs' 'hyprland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('9e2730fdd590c12af227d6cbffc206a34e33d6f9aaa8c3cfeeb8c55b58d3262d')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
