# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=claude-desktop
_pkgname=Claude-Desktop
pkgver=1.0.0
pkgrel=2
pkgdesc="An Electron-based desktop application for Claude2(unofficial)."
arch=('any')
url="https://github.com/Karenina-na/Claude-Desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=20.4.2'
)
source=(
    "${pkgname}-${pkgver}"::"git+${url}.git#tag=v${pkgver}"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            '4242209b2509c3b3cdebd5a6391a7a4c39d09932db2112c84e3200285d79429d')
build() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci --cache "${srcdir}/npm-cache"
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist-client/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}