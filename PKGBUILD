# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=0.7.0
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=('libkrun' 'libkrunfw' 'seatd' 'crun')
makedepends=('cargo' 'libkrun' 'libkrunfw')
options=(!lto !debug)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'Cargo.lock')
sha256sums=('379108b4de26d4312f4f92b2e0ff25d2ca1e97738e49e690701e4841769ff635'
            'fa31740ab74f363928e5a431a90f6eed42dcb61cef86cced3ebbf1de9ab4126a')

prepare() {
    cd "$pkgname-$pkgver"
    cp ../Cargo.lock .
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
