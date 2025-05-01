# Maintainer: Firegem <firinggems@hotmail.com>
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.3.13
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'lux-xtask.patch')
sha256sums=('6811cb67fd6c52fab123995819c2b9d5bdad2b0c8db500840b44d6e946ede08d'
            '3664097da8f0e1654e15ce3872b57bbf3c5fea6915ad206679e84f7eeb580ad4')

prepare() {
    cd "${pkgname%-cli}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    patch -Np1 -i ../lux-xtask.patch
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname%-cli}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=${PWD}/target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
    cargo run --frozen --release --package xtask -- dist
}

package() {
    cd "${pkgname%-cli}-${pkgver}"
    # main `lx` binary
    install -Dm0755 -t "${pkgdir}/usr/bin" target/dist/lx
    # install lux-lua library
    install -d "${pkgdir}/usr/lib/lua"
    cp -r -t "${pkgdir}/usr/lib/lua" target/dist/5.{1..4}
    # install license
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    # install shell completions
    install -Dm644 target/dist/lx.bash "${pkgdir}/usr/share/bash-completion/completions/lx"
    install -Dm644 -t "${pkgdir}/usr/share/zsh/site-functions" target/dist/_lx
    install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" target/dist/lx.fish
    # install man page
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" target/dist/lx.1
}
