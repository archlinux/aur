# Maintainer: ixaxaar <https://aur.archlinux.org/account/ixaxaar/>
pkgname=aiyou
pkgver=0.2.0
pkgrel=1
pkgdesc="Export, maintain and analyze all your AI coding-agent chat history in one git-versioned store"
arch=('x86_64' 'aarch64')
url="https://github.com/geniusrise/you"
license=('MIT')
depends=('gcc-libs' 'git')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/geniusrise/you/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a83a4553545bca85ca39e04811103ae73f004bb3420b59cccec5363a7d61c66d')

prepare() {
    cd "you-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "you-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked --frozen
    mkdir -p "$srcdir/completions"
    "$srcdir/target/release/aiyou" --shell bash > "$srcdir/completions/aiyou.bash"
    "$srcdir/target/release/aiyou" --shell zsh  > "$srcdir/completions/_aiyou"
    "$srcdir/target/release/aiyou" --shell fish > "$srcdir/completions/aiyou.fish"
}

check() {
    cd "you-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo test --release --locked --frozen
}

package() {
    cd "you-$pkgver"
    install -Dm755 "$srcdir/target/release/aiyou" "$pkgdir/usr/bin/aiyou"
    install -Dm644 README.md "$pkgdir/usr/share/doc/aiyou/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/aiyou/LICENSE"
    install -Dm644 "$srcdir/completions/aiyou.bash" "$pkgdir/usr/share/bash-completion/completions/aiyou"
    install -Dm644 "$srcdir/completions/_aiyou" "$pkgdir/usr/share/zsh/site-functions/_aiyou"
    install -Dm644 "$srcdir/completions/aiyou.fish" "$pkgdir/usr/share/fish/vendor_completions.d/aiyou.fish"
}
