# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=narsil-nvidia
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based system resource monitor — GPU-aware (NVIDIA), Braille charts, per-char label inversion"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/Pommersche92/narsil"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo')
provides=('narsil')
conflicts=('narsil' 'narsil-bin' 'narsil-nvidia-bin')
source=("narsil-$pkgver.tar.gz::https://static.crates.io/crates/narsil/narsil-$pkgver.crate")
sha256sums=('59aa41fd6fbedda475b0e8405b73c7145726ae925cd909635efa17356e07bf6d')

prepare() {
    cd "narsil-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "narsil-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --features nvidia
}

check() {
    cd "narsil-$pkgver"
    cargo test --frozen --features nvidia
}

package() {
    cd "narsil-$pkgver"
    install -Dm755 "target/release/narsil" "$pkgdir/usr/bin/narsil"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
