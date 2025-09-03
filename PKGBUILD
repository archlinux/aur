# Maintainer: wackbyte <im@purring.fyi>

pkgname=asphalt
pkgver=1.0.0
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('841b0b6901554e2b69c2a4eed588bcbddeddf4299ff253123281d3052f3a53ead188ab945e22a97eee5cb6abafcf3c993d60603d4f184cf4e778d320a95772e0')
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
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
