# Maintainer: wackbyte <im@purring.fyi>

pkgname=asphalt
pkgver=2.0.1
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'bump.patch')
b2sums=('719b68ac3712c84fab8e7330545241ac9f4c4d9b340c9f16200e88e8dd9f07691ddc020d37285c115fff542edb88a84766030eb4018bbc4f2f114fa4ae2b30b3'
        '5781546ddc78109d88af3dbadc32efcc067b38727691c7520098525c8f3acc50607f37c8237dfe415c082fa70480d94d5dced8c03605a17db99f5407cfcea4ee')
options=(!lto)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/bump.patch"
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
