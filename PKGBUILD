# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wireforge-git
_pkgname=wireforge
pkgver=r24.1683266
pkgrel=1
pkgdesc='Braille wireframe viewer and editor'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/Vaishnav-Sabari-Girish/wireforge'
license=('MIT')
makedepends=(
    'cargo'
    'git'
)
provides=('wireforge')
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
    install -Dm0755 target/release/wireforge "$pkgdir/usr/bin/wireforge"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
