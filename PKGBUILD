# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgbase=rio
pkgname=('rio' 'rio-terminfo')
pkgver=0.0.14
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64' 'aarch64')
url="https://github.com/raphamorim/${pkgbase}"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'python')
makedepends=('cargo' 'cmake' 'desktop-file-utils')
optdepends=()
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a38d8884fec088a5f374dd6761033a83d792a98efff94d8f7d7674e3c9eff53a3531a16044bcd86df1f1146ed264695eb3374c293d4de57e3352f160aeabf067')
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

    cd "${pkgbase}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgbase}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgbase}/" "README.md"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgbase}/" "LICENSE"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "misc/rio.desktop"
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
