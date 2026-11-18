# Maintainer: willow <willow@purring.fyi>

pkgname=foreman
pkgver=1.7.2
pkgrel=1
pkgdesc='Toolchain manager for Roblox projects'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/Roblox/foreman'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('dd45f3beec45e2bd735b1c53a0642203f2d26bde734f6133d75a7de4d9d639de7efb428e90cd63e011a5df311a80723eab23e18a96de4ca639e08796a96e1d90')
options=(!lto)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo test --frozen -- \
        --skip snapshot_install_all_tools_before_failing
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
