# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-vet
pkgver=0.3.0
# Repository tag omits trailing .0: for example, the tag for v0.3.0 is 0.3.
_tag=${pkgver%.0}
pkgrel=1
pkgdesc='Supply-chain security for Rust'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/mozilla/cargo-vet'
license=('Apache' 'MIT')
depends=(
    cargo
    gcc-libs
    glibc
    zlib
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_tag.tar.gz")
sha256sums=('801ce460dd7cd52b2a1fd39c0444c7dae21f80c756b9792f354d837db22e2596')

prepare() {
    cd "$pkgname-$_tag"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$_tag"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_tag"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen
}

package() {
    cd "$pkgname-$_tag"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
