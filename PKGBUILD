# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supalive-bin
_pkgname=Supalive
pkgver=0.0.34
pkgrel=1
pkgdesc="Aplicativo para alertas interativos em streaming, integrado com YouTube, Twitch e LivePix."
arch=("x86_64")
url="https://supalive.app/"
_githuburl="https://github.com/SupaLive/supalive"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron27'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://raw.githubusercontent.com/SupaLive/supalive/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('bc2499f517105c8b088d17cb164108f0e86bca87270d26eb1323fe9e1a0406db'
            'ce9191ae1267b0c88407a86c56917e6d9776ea5b5a7590addc65063faa9e9df9'
            '44791f429ff760718ed851c2b0190cec1b5fce3166cbd420309ee0824b51eb61')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}