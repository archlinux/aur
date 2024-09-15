# Maintainer:  Robin Candau <antiz@archlinux.org>
# Maintainer:  Crystal Linux Distribution Team <distribution@lists.getcryst.al>

pkgname=ame
_pkgname=amethyst
pkgver=4.0.8
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
sha256sums=('12e8e30e27edccbbb91110d68c98024f22b50ae0f1f9e045542c8ff32ee0cb09')

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
