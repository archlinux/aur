# Maintainer: yobson <aur@yobson.xyz>
pkgname=steam-screenshot-importer
pkgdesc='Automatic importing of screenshots into Steam using the Steamworks SDK'
pkgver=1.0.0
pkgrel=1
_steamworks_rs_ver=0.13.1
arch=('x86_64')
url="https://github.com/yobson1/${pkgname}"
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('dav1d' 'desktop-file-utils' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'xdg-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-src_${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-src_${pkgver}.tar.gz.asc"
    "https://github.com/Noxime/steamworks-rs/raw/refs/tags/v${_steamworks_rs_ver}/steamworks-sys/lib/steam/redistributable_bin/linux64/libsteam_api.so")
validpgpkeys=('A41EB2986F63F6C40FCF2D03ED26A71EB8EB7A34') # Bradley (github commit signing key) <contact@yobson.xyz>
b2sums=('f1c8df45013bc3fbe1c5ae547aeaf54e15a24afcaa702c3d141240ef71366d930fc0a35411509f4d5d412166cc9e4f5fa9aa8025a80d887e75e619990a4bbd30'
        'SKIP'
        '8e4502c07a034bcfbae2b57439d56c2bc3b48ef5f9d4737ee627bf2d0a82921c41a34df7611dd1f582e2782af2f4340e65e9f9b8409a563726d1bd7edcbeaf47')
options=('!lto')

prepare() {
    cd "$srcdir/$pkgname-src_${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname-src_${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export NO_STEAMWORKS=1 # we already got this in our source array

    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-src_${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/libsteam_api.so" "${pkgdir}/usr/lib/${pkgname}/libsteam_api.so"
    install -Dm644 "pkg/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    local size
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
