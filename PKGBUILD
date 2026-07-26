# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
declare srcdir pkgdir
pkgname='sweep-rs-git'
_pkgname="${pkgname%-git}"
pkgdesc='Sweep is a tool for interactive search through a list of entries.'
provides=('sweep-rs')
url='https://github.com/aslpavel/sweep-rs'
arch=('x86_64')
pkgrel=1
pkgver=r498.552e010
source=('sweep-rs::git+https://github.com/aslpavel/sweep-rs')
sha1sums=('SKIP')
makedepends=(cargo git)
license=('MIT')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/sweep"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sweep-rs/LICENSE"
}
