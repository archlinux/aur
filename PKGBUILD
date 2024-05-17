# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=cargo-limit
pkgver=0.0.10
pkgrel=1
pkgdesc="Cargo with less noise"
arch=(x86_64)
url="https://github.com/cargo-limit/cargo-limit"
license=(MIT Apache-2.0)
depends=(
    cargo
    gcc-libs
    glibc
)
makedepends=(rust)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('85fe2b48178494123fddbfcc94c0a796629eb21ebca579de6a2408fc6d2a553c')

prepare() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver" || exit

    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

    install -vDm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
