# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=rust-analyzer-vscode-git
pkgver=r7300.c9e1aab88
pkgrel=2
pkgdesc='An experimental Rust compiler front-end for IDEs (VSCode installation).'
arch=('any')
url='https://github.com/rust-analyzer/rust-analyzer/'
license=('MIT')
depends=('rustup' 'code')
makedepends=('git' 'npm>=6.10.0')
provides=("${pkgname}")
conflicts=("${pkgname}" 'rust-analyzer-git')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    rustup update
    rustup install stable
    cargo +stable build --release
    rustup component add rust-src
}

package() {
    cd "${pkgname}"
    cargo xtask install
    install -D -m755 ~/.cargo/bin/ra_lsp_server "${pkgdir}/usr/bin/ra_lsp_server"
}
