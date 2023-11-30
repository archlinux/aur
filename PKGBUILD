# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ente
pkgname="${_pkgname}-desktop-bin"
pkgver=1.6.54
pkgrel=1
pkgdesc="Desktop app for ente Photos"
arch=('x86_64')
url="https://github.com/ente-io/photos-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libdrm'
    'libxcb'
    'libxcomposite'
    'libx11'
    'libxkbcommon'
    'libxext'
    'cairo'
    'gtk3'
    'libxrandr'
    'hicolor-icon-theme'
    'libxfixes'
    'nss'
    'pango'
    'at-spi2-core'
    'expat'
    'nspr'
    'libxdamage'
    'mesa'
    'libcups'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman"
)
sha256sums=('39594e4bf8d596e968c4d77c2c6455a2e1119ef3e1a8bcd953a1d3f5c14ca9fb')
build() {
    sed -e "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin} --no-sandbox %U|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Photography|Graphics|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}