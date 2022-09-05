# Maintainer: Jeff Dickey <releases at chim dot sh>

pkgname=chim
pkgver=1.0.2
pkgrel=1
pkgdesc='Cross-platform binary shims with optional remote fetching'
arch=('x86_64' 'aarch64')
url='https://chim.sh'
license=('MIT')
makedepends=('cargo' 'jq')
provides=('chim')
conflicts=('chim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('725ed27c09be809a592a3eccef7de3f161db2393a4b67b60538d8d2cd4f39221e91dd3465636343ed4b5d2f5dc422eff52380ea852024cfce4b38c6797acd095')

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
