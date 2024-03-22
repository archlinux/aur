# Maintainer: Alix Bernard <alix.bernard9 at gmail dot com>

pkgname=cpu-cli-controller
pkgver=0.2.0
pkgrel=1
pkgdesc="A Linux CPU controller CLI tool"
url="https://github.com/AlixBernard/$pkgname"
license=("MIT")
makedepends=("cargo")
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlixBernard/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("5bacce42acff74f3091ba984e9a2247e572646c74ca08a149bac89722cfca9f3")

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo update  # This step should be removed when figured out how
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
