# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=rio
_pkgver=0.0.5
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64' 'aarch64')
url="https://github.com/raphamorim/${pkgname}"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'python')
makedepends=('cargo' 'cmake' 'desktop-file-utils')
optdepends=()
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        'rio.desktop')
b2sums=('cdbfbc0925e0ac64d170c8b9f0797ae9cca20acfac62b737c0bbf8f96fb69c7cd8b49eb5f0385e67ea8eb8c5aa04f160e37bfa772da62984005d78351bc19f7c'
        '4725c1ab72b7cdcc055912e97827fd2705d48ee6f084d469f0fbbff4ce65f25ab715e4f208cb7058961e4001c273c9f444065b3aa64a85a638c25b84a2688d50')
backup=()

prepare() {
    cd "${pkgname}-${_pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${_pkgver}"
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0

    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${_pkgver}"
    export CARGO_INCREMENTAL=0

    cargo test --frozen -p rio
}

package() {
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "rio.desktop"

    cd "${pkgname}-${_pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
    install -Dm0644 "rio/src/screen/window/resources/images/logo-macos.png" "${pkgdir}/usr/share/pixmaps/rio.png"
}
