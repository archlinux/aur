# Maintainer: RubixDev <silas dot groh at t-online dot de>
pkgname=pixfetch
pkgver=0.1.0
pkgrel=2
pkgdesc="A fetch program with variable sized pixel images"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/RubixDev/pixfetch"
license=('GPL2')
depends=()
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('421aaee7c016631344a95b2c997039d9e30e2e4b018e8d5016822196bb2a580014c8ef7667ec1b404d72db362baeedb04798314d4008adbd9eabe8ee9c647823')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --message-format=json-render-diagnostics |
        jq -r 'select(.out_dir) | select(.package_id | startswith("pixfetch ")) | .out_dir' > out_dir
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    local OUT_DIR=$(<out_dir)

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 "$OUT_DIR/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$OUT_DIR/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$OUT_DIR/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "$OUT_DIR/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
