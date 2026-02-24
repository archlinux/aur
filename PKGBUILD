# Maintainer: Raimo Geisel <raimog92@gmail.com>

pkgname=lazyllama
pkgver=0.5.0
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
sha256sums=('4cf481021a79f5653648c8b796e9ef8a7d919b06afa009b78dba282f23cb94ca')

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
