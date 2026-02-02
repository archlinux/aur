# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lqth
pkgver=0.2.5
pkgrel=1
pkgdesc='Simple but blazingly fast screenshot utility'
arch=('x86_64')
url='https://github.com/0x61nas/lqth'
license=('MIT')
makedepends=('cargo' 'libx11')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE::https://raw.githubusercontent.com/0x61nas/lqth/refs/tags/$pkgver/LICENSE"
    "lqth.1::https://raw.githubusercontent.com/0x61nas/lqth/refs/tags/$pkgver/man/lqth.1"
    "$pkgname-$pkgver.tar.gz.asc"
    'LICENSE.asc'
    'lqth.1.asc')
sha256sums=('e2a362d6f7f3b10dcad99a0690e32c1f8678e26167d3608c5be79fe94213a4e3'
            'ddc49ced9f48c7402b323b4f379bf92973c44ae63f5ba047f828121efafcd319'
            '03f3ebaec29bc2ca4a8e1854de6951b51d0bb04d74c7b4871cae0eb5dd0f8c79'
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
    install -Dm0755 'target/release/lqth' "$pkgdir/usr/bin/lqth"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" ../lqth.1
    command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/lqth.1"
}

