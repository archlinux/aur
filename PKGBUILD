# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=niffler-git
_pkgname=niffler
pkgver=r13.e4689ba
pkgrel=1
pkgdesc='Trello-like Kanban board for the terminal. No database. Every card is just a local Markdown file.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
    'armv7'
)
url='https://github.com/Newt6611/niffler'
license=(
    'MIT'
    'Apache-2.0'
)
makedepends=(
    'cargo'
    'git'
)
options=(
    # !lto
    !debug
)
provides=('niffler')
conflicts=('niffler')
source=("$_pkgname-main::git+$url.git#branch=main")
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
    install -Dm0755 target/release/niffler "$pkgdir/usr/bin/niffler"
    install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
