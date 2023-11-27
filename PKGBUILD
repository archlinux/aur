# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-chat
_pkgname=GhostChat
pkgver=2.4.0
pkgrel=1
pkgdesc="A standalone, multiplatform Twitch.tv chat as overlay on windowed/windowed fullscreen applications."
arch=('any')
url="https://github.com/Enubia/ghost-chat"
license=('custom:Zlib')
conflicts=("${pkgname}")
depends=(
    'electron26'
    'hicolor-icon-theme'
)
makedepends=(
    'pnpm'
    'gendesk'
    'npm'
    'nodejs>=20'
)
source=(
    "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('c91a402d913aa49a0183ed54e3cdbe13ef1c76dc76704e9671c74e1190032f45'
            'b5235b0b418d6e9a6e90b8689b2ea05280a3fd4b666e94735beae17ae33c3df6')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed 's|, "deb"||g' -i electron-builder.json5
    pnpm install --frozen-lockfile
    pnpm run build-production
    cp "${srcdir}/${pkgname}-${pkgver}/dist/icons/icon-512x125.png" "${srcdir}/${pkgname}-${pkgver}/dist/icons/icon-512x512.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/icons/icon-${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}