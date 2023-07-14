# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgbase=rio
pkgname=('rio' 'rio-terminfo')
pkgver=0.0.9
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64' 'aarch64')
url="https://github.com/raphamorim/${pkgbase}"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'python')
makedepends=('cargo' 'cmake' 'desktop-file-utils')
optdepends=()
source=(
    "${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'rio.desktop')
b2sums=(
    '45befe3b7eac64affd4ad0ffc34ff2fa33daf74da1049a75bdb3066d31735b7ebcb6b022ba841128af1c89fc2699d4a5a993e22b0272f0f60196b05f10f41c9b'
    'cdb6a76cae33968b23a5d950c727151b152ea2c2951df0eda08e825d366eb41d7c9182aabb6cf85efe62a66010ce50096582b6300659f781dd5bd0e7a3646041')
backup=()

prepare() {
    cd "${pkgbase}-${pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgbase}-${pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0

    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgbase}-${pkgver}"
    export CARGO_INCREMENTAL=0

    cargo test --frozen --workspace
}

package_rio() {
    depends+=('rio-terminfo')
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "rio.desktop"

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgbase}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgbase}/" "README.md"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgbase}/" "LICENSE"
    install -Dm0644 "rio/src/screen/window/resources/images/logo-macos.png" "${pkgdir}/usr/share/pixmaps/rio.png"
}

package_rio-terminfo() {
    pkgdesc="Terminfo for rio, a hardware-accelerated GPU terminal emulator powered by WebGPU"
    arch=('any')
    depends=('ncurses')

    cd "${pkgbase}-${pkgver}"
    install -d "${pkgdir}/usr/share/terminfo"
    tic -x -o "${pkgdir}/usr/share/terminfo" "misc/rio.terminfo"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgbase}-terminfo/" "LICENSE"
}
