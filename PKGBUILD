# Maintainer: wackbyte <im@purring.fyi>

pkgname=foreman
pkgver=1.7.0
pkgrel=1
pkgdesc='Toolchain manager for Roblox projects'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/Roblox/foreman'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('7c5a89b07dc8c32d435df219b16b4b7975e0739a51e29c824aa74ceb78273d20513056337c0cda99d93cdcfbe49c46af893c7afefdea006152357370e2966f8c')
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
