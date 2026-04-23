# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=0.5.20
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=('libkrun' 'libkrunfw')
makedepends=('cargo' 'libkrun' 'libkrunfw')
options=(!lto)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'Cargo.lock')
sha256sums=('ceba9666a1a3fcd3bc909423ef1bd550f4b9d0f12d07b4f166e53357888f2e81'
            '14e0cd94bea5be9b8236951fcb6205660df0875518174c0520a18fd40a16ac89')

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
