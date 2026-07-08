# Maintainer: wackbyte <im@purring.fyi>

pkgname=asphalt
pkgver=2.0.2
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'bump.patch')
b2sums=('b03b5d7a747f4dc64bd80438aa3f8d2872039eea9349a5298390e46d240edc5aaa3bab2a96568688f97052de36c8107ca86140234453c51c3f40a80326ee5de8'
        'c19fb35197984931ad89b838683d25fe475bdab3c68f3730000866d1765229f6db711cf343dd9d1a2b3963312dce1d972cd08e0efa98fbd4759771e4b6b1abfa')
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
