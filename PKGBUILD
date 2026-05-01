# Maintainer: Zmole Cristian <tragdate@gmail.com>
pkgname=rustgraph
pkgver=0.7.11
pkgrel=1
pkgdesc="Rust code navigation built for AiDX — AST-aware, MCP-native, token-efficient."
arch=('x86_64')
url="https://github.com/ZmoleCristian/rustgraph"
license=('0BSD')
depends=('gcc-libs')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZmoleCristian/rustgraph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b23c3cd00f1f05f955c2936043deff5b907e8a0fca254978206f5382ff9fc907')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

    "./target/release/$pkgname" completions bash > "$srcdir/$pkgname.bash"
    "./target/release/$pkgname" completions zsh  > "$srcdir/_$pkgname"
    "./target/release/$pkgname" completions fish > "$srcdir/$pkgname.fish"
    install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$srcdir/_$pkgname"     "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
