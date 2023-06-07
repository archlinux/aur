# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=rio
pkgver=0.0.6
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64' 'aarch64')
url="https://github.com/raphamorim/${pkgname}"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'python')
makedepends=('cargo' 'cmake' 'desktop-file-utils')
optdepends=()
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'rio.desktop::rio.desktop'
    'rio-pull86-fix-cl-wayland.patch::https://patch-diff.githubusercontent.com/raw/raphamorim/rio/pull/86.patch')
b2sums=(
    '478f7e0585391fabb18e97a454041f937b3651c3080c696e3dcb5dfdc9ef6b681c1f848afbba7e1075c96f34b873161127a1e33a712d04eee6040dfe32ea5791'
    'cdb6a76cae33968b23a5d950c727151b152ea2c2951df0eda08e825d366eb41d7c9182aabb6cf85efe62a66010ce50096582b6300659f781dd5bd0e7a3646041'
    '268f8bcf1675dd6c8cfb0b0d5bfcb91e3e400dede03d59b6db0a300b017d52a05033eeba42a4bdf767ce4b0049933df5c44a293ccf7114472998e73898c4a835')
backup=()

prepare() {
    cd "${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

    patch --forward --strip=1 --input="${srcdir}/rio-pull86-fix-cl-wayland.patch"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0

    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export CARGO_INCREMENTAL=0

    cargo test --frozen --workspace
}

package() {
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "rio.desktop"

    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
    install -Dm0644 "rio/src/screen/window/resources/images/logo-macos.png" "${pkgdir}/usr/share/pixmaps/rio.png"
}
