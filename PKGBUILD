# Maintainer: mirdukkkkk <me@mrdk.uk>

pkgname=beefetch
pkgver=3.0.0
pkgrel=1
pkgdesc="Neofetch clone written in Rust with the ability to display 🐝"
arch=('x86_64' 'aarch64')
url="https://github.com/mirdukkkkk/beefetch"
license=('GPL-3.0-only')

depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ab9fdd9917c88b3670f81b9e2c3a3fea56263d598dfcc5447dae8a08251c5d6f4454ef72e15c6ebfe4c13ce11fd4ebd21b836fd5c0738ab666e1e492b0350d9e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    local bin=target/release/beefetch

    install -Dm755 "$bin" "$pkgdir/usr/bin/beefetch"
    install -Dm644 docs/beefetch.1 "$pkgdir/usr/share/man/man1/beefetch.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    "$bin" --bpaf-complete-style-bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/beefetch"
    "$bin" --bpaf-complete-style-zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_beefetch"
    "$bin" --bpaf-complete-style-fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/beefetch.fish"
}
