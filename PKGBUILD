# Maintainer: acuteenvy
pkgname=tlrc
pkgver=1.12.0
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
b2sums=('1c4682c528c981629d38faf0a15400521d2e53eb10c635b1713be2e29cc17fe3f68f2d1efd67d457b6933d4bd9b009cfefdbcbb1731d35f5fe5abd2c6bf24593')
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
