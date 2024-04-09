# Maintainer:  Robin Candau <antiz@archlinux.org>
# Maintainer:  Crystal Linux Distribution Team <distribution@lists.getcryst.al>

pkgname=ame
_pkgname=amethyst
pkgver=4.0.5
pkgrel=1
pkgdesc='Amethyst is a fast and efficient AUR helper'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/crystal-linux/software/${_pkgname}"
license=('GPL-3.0-only')
depends=(
    'git'
    'pacman-contrib'
    'vim'
    'expac'
    'less'
)
makedepends=('cargo' 'clang' 'lld')
source=("${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('a574cd63911886f87bbdf961ff345840667fe78b17042bec99e0e5888a7b0699')

prepare() {
    cd "${_pkgname}-v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-v${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS='-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld'
    export CC=clang
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-v${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
