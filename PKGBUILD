# Maintainer: Techcable <techcable at techcable dot net>

pkgname=bookmark-cd
pkgver=1.0.25
pkgrel=1
pkgdesc="Bookmark directories and move to them"
arch=('x86_64' 'aarch64')
url="https://github.com/a1ecbr0wn/bcd"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
optdepends=('bash: shell integration'
            'zsh: shell integration'
            'ksh: shell integration'
            'fish: shell integration')
# Use crates.io as a source, because it has the correct Cargo.lock (the one from github complains about updates)
# and it is immutable (not subject to `git-archive` changes)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('a4d41a6017c62a6eabb15a3a9f7b02abb6f6c07021b1b5573a81d3384c197e87')

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
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/bookmark-cd"
}
