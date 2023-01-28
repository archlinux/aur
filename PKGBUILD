# Maintainer: Jeff Dickey <releases at chim dot sh>

pkgname=rtx
pkgver=1.2.1
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo' 'jq')
provides=('rtx')
conflicts=('rtx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8ed252212df666ae8f42b6159b26f273eed54d7368023bfca44d3622c35cf6d5754bf742f4afba3466bb5501e2a2f726cf607d5e7c4ebae0127908faa0b95045')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --message-format=json-render-diagnostics |
      jq -r 'select(.out_dir) | select(.package_id | startswith("ripgrep ")) | .out_dir' > out_dir
}

package() {
    cd "$pkgname-$pkgver"
    local OUT_DIR=$(<out_dir)

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --locked
}
