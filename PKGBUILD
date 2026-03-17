# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty
pkgver=0.8.2
pkgrel=3
pkgdesc='Simple CLI tool to convert the images to ASCII art'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/0x61nas/aarty'
license=('MIT')
makedepends=('cargo')
provides=('aarty')
conflicts=('aarty-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE::https://raw.githubusercontent.com/0x61nas/aarty/refs/tags/v$pkgver/LICENSE.txt"
    "aarty.1::https://raw.githubusercontent.com/0x61nas/aarty/refs/tags/v$pkgver/man/aarty.1")
sha256sums=('5e856c0c003cfbb158e1df931dfeaa15ab565654c77aca0a78a2e730e5a356cc'
            'ddc49ced9f48c7402b323b4f379bf92973c44ae63f5ba047f828121efafcd319'
            'ce82d7d52cd0042057c7d51a7834968853adfff4454207a01909197c31b4c667')

prepare() {
    cd "$pkgname-$pkgver"
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
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/aarty"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" ../aarty.1
    command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/aarty.1"
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
