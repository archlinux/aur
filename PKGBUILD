# Maintainer: Techcable <techcable at techcable dot net>

pkgname=bookmark-cd
pkgver=1.1.0
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

sha256sums=('2fc8a3ebbb75c72ed35a9549b032ad7c15dafab117e596a8ffc0f00544c990ca')

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
