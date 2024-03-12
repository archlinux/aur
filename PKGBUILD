# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=cargo-wizard
pkgver=0.2.2
pkgrel=1
pkgdesc='Cargo subcommand for configuring Cargo profile'
arch=('x86_64' 'aarch64')
url='https://github.com/Kobzol/cargo-wizard'
license=('MIT')
makedepends=(cargo)
conflicts=(cargo-wizard-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86fc230ed1989f36a99686ac7977b3048ef4143393daa26d47febc860486d7f9')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"

    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all
}

package() {
    cd "$pkgname-$pkgver"

    # binary
    install -Dm 755 "target/release/cargo-wizard" -t "$pkgdir/usr/bin"

    # license
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
