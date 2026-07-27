# Maintainer: Raimo Geisel <raimog92@gmail.com>

pkgname=lazyllama
pkgver=0.5.3
pkgrel=1
pkgdesc="A lightweight TUI client for Ollama with markdown support and smart scrolling"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/Pommersche92/lazyllama"
license=('GPL-2.0-or-later')
depends=()
makedepends=('cargo')
provides=('lazyllama')
conflicts=('lazyllama-bin')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('3c60dc955168a97f7da3d8bec8385caff231aa772b201fbe36b01584ac12b12e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
