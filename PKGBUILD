# Maintainer: wackbyte <wackbyte@protonmail.com>

pkgname=foreman
pkgver=1.6.3
pkgrel=1
pkgdesc='Toolchain manager for Roblox projects'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/Roblox/foreman'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('bfc45a9d303bd6a477d0ffbf50f6ad4c01b97adb21a9818541f88ea9f226408a4bd619c8c328ba8a877b141ad86d3774ff90f68b0276d15d2d513a2c453bd3af')
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
