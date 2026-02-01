# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty
pkgver=0.8.1
pkgrel=1
pkgdesc='Simple CLI tool to convert the images to ASCII art'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/0x61nas/aarty"
license=('MIT')
makedepends=('cargo')
provides=('aarty')
conflicts=('aarty-git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE::https://raw.githubusercontent.com/0x61nas/aarty/refs/tags/v$pkgver/LICENSE.txt"
    "aarty.1::https://raw.githubusercontent.com/0x61nas/aarty/refs/tags/v$pkgver/man/aarty.1"
    "$pkgname-$pkgver.tar.gz.asc"
    'LICENSE.asc'
    'aarty.1.asc')
sha256sums=('25386951b910afe8ac6f84408fa65c425a4efdec46f0173250b1305c956021c3'
            'ddc49ced9f48c7402b323b4f379bf92973c44ae63f5ba047f828121efafcd319'
            '10d32b22ace47f09fdd0567a683a98e81c8a9e19481ae7649e30eab7390bbc1e'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

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

