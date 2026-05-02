# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Sebaguardian <sebaguardian13@gmail.com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

# shellcheck shell=bash disable=SC2034,SC2164

pkgname=arnis
pkgver=2.7.0
pkgrel=1
pkgdesc='Generate any location from the real world in Minecraft'
arch=('x86_64')
url="https://github.com/louis-e/${pkgname}"
license=('Apache-2.0')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'wayland' 'webkit2gtk-4.1')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a325392dfcf17f414c2ef8667d55c2c88088b93d26d14c4623939ff6d8e02ef8')

prepare() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

    # Desktop integration files
    install -Dm644 "src/gui/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 icons/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}

# vim: ts=4 sw=4 et:
