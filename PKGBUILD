# Maintainer: Firegem <firinggems@hotmail.com>
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.15.0
pkgrel=1
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/nvim-neorocks/lux"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libgit2' 'libgpg-error' 'gpgme' 'bzip2' 'xz')
makedepends=('cargo' 'openssl')
provides=('lx')
conflicts=('lux-cli-git')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a4dc42f635ec04cdc847cc2af29a316e8c7194eab25dbd60a2bfe2c0f17207f')

prepare() {
    cd "${pkgname%-cli}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname%-cli}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=${PWD}/target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
    cargo build --features vendored --frozen --release
    cargo run --frozen --release --package xtask -- dist-completions
}

package() {
    cd "${pkgname%-cli}-${pkgver}"
    # main `lx` binary
    install -Dm0755 -t "${pkgdir}/usr/bin" target/release/lx
    # install license
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    # install shell completions
    install -Dm644 target/dist/lx.bash "${pkgdir}/usr/share/bash-completion/completions/lx"
    install -Dm644 -t "${pkgdir}/usr/share/zsh/site-functions" target/dist/_lx
    install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" target/dist/lx.fish
}
