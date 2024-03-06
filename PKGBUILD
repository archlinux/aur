# Maintainer:  Robin Candau <antiz@archlinux.org>
# Maintainer:  Crystal Linux Distribution Team <distribution@lists.getcryst.al>

pkgname=ame
_pkgname=amethyst
pkgver=4.0.3
pkgrel=8
_codename='Funky Fish'
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
makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('850b6eda89316e4da1148506377471c1cda878077143b6f1983b61b0dba8d8c0')

prepare() {
    cd "${_pkgname}-v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-v${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export AMETHYST_CODENAME="${_codename}"
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-v${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
