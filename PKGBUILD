# Maintainer: Adam Ferrick <adameferrick at gmail dot com>

pkgname=kak-tree-sitter-git
pkgver=r857.f5f9ac1
pkgrel=1
pkgdesc="A binary server that interfaces tree-sitter with kakoune."
arch=('x86_64')
url="https://git.sr.ht/~hadronized/kak-tree-sitter"
license=('BSD3')
depends=('kakoune')
makedepends=('cargo' 'git')
options=(!debug !lto)
install=$pkgname.install
source=(${pkgname}::git+https://git.sr.ht/~hadronized/kak-tree-sitter)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    printf "\n%s\n" "Building kak-tree-sitter"
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm 755 "${srcdir}/${pkgname}/target/release/kak-tree-sitter" "${pkgdir}/usr/bin/kak-tree-sitter"
    install -Dm 755 "${srcdir}/${pkgname}/target/release/ktsctl" "${pkgdir}/usr/bin/ktsctl"
}
