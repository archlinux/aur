# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware, Braille charts, per-char label inversion"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo')
provides=('narsil')
conflicts=('narsil-bin')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a868bddc62b870e930003f559c54bd278b86a868dfd3fcd954da3246e6390bd2')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
