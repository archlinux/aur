# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=0.5.19
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=('libkrun')
makedepends=('cargo' 'libkrun')
options=(!lto)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'Cargo.lock')
sha256sums=('8390765e2cae5379892315472705cbf3a9bcafe71aef47b5e91b4095001fcc4b'
            'd9f26bb225bd5a0e38a217810c48bba8f4df4f5b7a997469b1c03db4f33a01f1')

prepare() {
    cd "$pkgname-$pkgver"
    cp ../Cargo.lock .
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/smolvm "$pkgdir/usr/bin/smolvm"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
