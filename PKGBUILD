# Maintainer: Jay Thomas <jay@gfax.ch>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=clutch
pkgver=0.1.0
pkgrel=3
pkgdesc="A highly customizable TUI RPC interface for the Transmission bittorrent client"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jay-thomas/clutch"
license=('GPL-3.0-only')
depends=('libgcc')
makedepends=('git' 'cargo')
optdepends=('bash-completion: tab completion for bash'
            'fish: tab completion for fish'
            'zsh: tab completion for zsh (requires compinit in ~/.zshrc)')
options=('!debug' '!lto')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('dc6dddaa6c082c9cfec25ed37eae39f8300b62f89bb905a07745231761c526b5')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "completions/$pkgname.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/_$pkgname" \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
