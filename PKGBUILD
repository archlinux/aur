# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=chess-cat-git
_pkgname=chess-cat
pkgver=r16.56350e2
pkgrel=1
pkgdesc='Visualize chess boards in your terminal'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/ptsouchlos/chess-cat'
license=('MIT')
makedepends=('cargo' 'git')
provides=('chess-cat')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/chess-cat "$pkgdir/usr/bin/chess-cat"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
