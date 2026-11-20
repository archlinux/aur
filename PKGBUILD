# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-conversation-search
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI + MCP tool for searching Claude Code conversation history with Tantivy/BM25"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/claude-conversation-search-mcp"
license=('GPL-3.0-only')
makedepends=('cargo')
options=('!lto')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('d3d3d3ccdfc2e981056bcef8e20764dc8ca9ab4418a3b10773984daa88592143'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    local bin="target/release/$pkgname"
    install -Dm755 "$bin" "$pkgdir/usr/bin/$pkgname"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d"
    "$bin" completions bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$bin" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$bin" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 packaging/$pkgname-index.service "$pkgdir/usr/lib/systemd/user/$pkgname-index.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
