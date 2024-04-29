# Maintainer: acuteenvy
pkgname=tlrc
pkgver=1.9.2
pkgrel=1
pkgdesc="Official tldr client written in Rust"
arch=('x86_64')
url="https://github.com/tldr-pages/$pkgname"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('tldr')
conflicts=('tldr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('af610d3484c9f8aca0eb091ab6d92d9ef88dce62c100828febdeb80dead105e3a7bfe0432a8e69227c5cf65072157d94446556752efc459bd282f43bdc7f89f8')
# This is needed for `ring` to compile. See https://github.com/briansmith/ring/issues/1444
options=('!lto')

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
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
