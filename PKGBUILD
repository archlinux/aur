# Maintainer: Yeremi Rios <contact@yarso.dev>
pkgname=systemctl-manager
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple utility to interact with systemd services through a TUI (Vim-Keys)"
url="https://github.com/yarso-su/systemctl-manager"
license=("MIT")
arch=("x86_64")
depends=("systemd")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=("8b8293c9889a4aee8fc9abc2ca014d7687ffaf93871ee1b2778f3c2692e9d5b9")

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/sm" "$pkgdir/usr/bin/sm"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
