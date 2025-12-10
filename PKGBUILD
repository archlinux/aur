# Maintainer: Yeremi Rios <contact@yarso.dev>
pkgname=systemctl-manager
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple utility to interact with systemd services through a TUI (Vim-Keys)"
url="https://github.com/yarso-su/systemctl-manager"
license=("MIT")
arch=("x86_64")
depends=("systemd")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=("89fc72d15e4dd70dec65d2682366b77db3231013a78f3621c357a5b4dcb54e06")

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
