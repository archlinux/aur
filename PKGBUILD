# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy
pkgver=2024.3
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo')
checkdepends=('cargo')
provides=('halloy')
conflicts=('halloy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/squidowl/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49ea53780037a27e71603f14e92da18cfadd5ee7b7725a697a096dfa2e07d184')

prepare() {
    cd "${pkgname}-${pkgver}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm644 "assets/linux/org.squidowl.${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/appdata/metainfo"
    install -Dm644 "assets/linux/org.squidowl.${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "assets/linux/org.squidowl.${pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
