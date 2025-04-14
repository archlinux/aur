# Maintainer: Firegem <firinggems@hotmail.com>
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.3.5
pkgrel=1
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://github.com/nvim-neorocks/lux"
license=('MIT')
depends=('glibc' 'gcc-libs' 'luajit' 'xz' 'bzip2' 'libgit2' 'openssl' 'libgpg-error' 'gpgme')
makedepends=('cargo')
provides=('lx')
conflicts=('lux-cli-git')
options=('!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
    "LICENSE.txt::https://github.com/nvim-neorocks/lux/raw/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('24eba44b139783077273ead70198e64ff2f2aa7cf8213ec709c2773e6aad03c4'
            'f4a0df3d94b10aebad58f6e7668ddd0249ee2a21bae13615c342eb3e00d20733')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" 'target/release/lx'
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
