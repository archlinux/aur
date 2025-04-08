# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=lux-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64')
url="https://github.com/nvim-neorocks/lux"
license=('MIT')
depends=('glibc' 'gcc-libs' 'luajit' 'xz' 'bzip2' 'libgit2' 'openssl' 'libgpg-error' 'gpgme')
makedepends=('cargo')
provides=('lx')
conflicts=('lux-cli-git')
options=('!lto' '!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
    "LICENSE.txt::https://github.com/nvim-neorocks/lux/raw/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('3f99ca426f0846c4da1b5f17a87ddbbae495f43a7b5100009ff87db015d6467a'
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
