# Maintainer: Firegem <firinggems@hotmail.com>
# shellcheck disable=SC2034,2154,2164
pkgname=lux-cli
pkgver=0.20.0
pkgrel=1
pkgdesc="A luxurious package manager for Lua"
arch=('x86_64' 'aarch64')
url="https://lux.lumen-labs.org"
repo_url="https://github.com/lumen-oss/lux"
license=('LGPLv3')
depends=('glibc' 'gcc-libs' 'libgpg-error' 'gpgme' 'bzip2' 'xz')
makedepends=('cargo' 'perl')
provides=('lx')
conflicts=('lux-cli-git' 'lux-cli-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${repo_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f9143d2b72fb277f12634eb3c34c09740787ca645ebd5e318411b33e24795c8e')

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
