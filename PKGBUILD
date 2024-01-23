# Maintainer: A Farzat <a@farzat.xyz>

_pkgname=prosemd-lsp
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=2
pkgdesc="An experimental proofreading and linting language server for markdown files."
url="https://github.com/kitten/prosemd-lsp"
depends=('gcc-libs')
makedepends=('cargo')
license=('LGPL')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('b5663be663a8c9dff90f728d223bdb0744e26c098f0f55f2e02a0340c0375c844f12d56d0474da1816df7f246e2da05c1a5f70b103b0a19033a7aa372aca9ade')

prepare() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # According to https://aur.archlinux.org/packages/prosemd-lsp#comment-904906,
    # required to get Rust to link the Oniguruma library into the resulting program
    export RUSTONIG_STATIC_LIBONIG=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
