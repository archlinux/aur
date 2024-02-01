# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.3.3
pkgrel=2
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('aarch64' 'x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'scour')
_logo_commit='25c1d2c08894fcb0ed39c36a2816316a161c0e57'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/gotify/logo/archive/${_logo_commit}.tar.gz")
sha512sums=('42561d2f46df7065528a6ed06279e091311dfa83847e558d22be275ceb0ee05e416fe9de99309531c87b5716d3d58b73482741f1732515b63821d650128d0f6c'
            'c7d8a581446688f70231841acea2905e5a0c3b0c912e2864d502cbf9fbddbdd83655d0cc67dff7fcbcb8e7a2f175e76e96be1ecdec18f3ccf1769787dc82393b')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release

    cd "${srcdir}/logo-${_logo_commit}"
    scour --no-line-breaks \
          --remove-descriptive-elements \
          --enable-viewboxing \
          --enable-id-stripping \
          --shorten-ids \
          -i gotify-logo-small.svg \
          -o gotify-logo-small-minified.svg
    
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 755 -t "${pkgdir}/usr/share/applications" ./desktop/${pkgname}.desktop
    install -Dm 755 "${srcdir}/logo-${_logo_commit}/gotify-logo-small-minified.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
