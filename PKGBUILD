# Maintainer: Jeff Dickey <releases at chim dot sh>

pkgname=rtx
pkgver=1.5.2
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo' 'jq')
provides=('rtx')
conflicts=('rtx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c5320778211ff2e2cb73af307b80b3b1e010be65537805772e01e7d578b38563100e71539e55161b6685d7c8ee86b25377e321738423295936e71cbd0c9beca0')

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
