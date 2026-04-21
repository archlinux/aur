# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI tool and verification framework for spec-driven development"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT' 'Apache-2.0')
makedepends=('cargo' 'pnpm' 'nodejs')
options=(!debug)
optdepends=('supersigil-lsp: language server for editor integration')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install --frozen-lockfile
    pnpm run bundle:cli-assets
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p supersigil
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/supersigil" "${pkgdir}/usr/bin/supersigil"
}
