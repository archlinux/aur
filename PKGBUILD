# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord
_pkgname=ArmCord
pkgver=3.2.4
pkgrel=2
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('any')
url="https://armcord.app/"
_githuburl="https://github.com/ArmCord/ArmCord"
license=('custom:OSL3')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'pnpm' 'nodejs>=18.0.0' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('3fbbdc9e348122edd46747138824b99517e0347ae80a49fe06b9dddc942cf428'
            '6fbe14d82200eac48baeef89fa86f0a265db016a0e4e8ed164dceaa2e54001d4')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pnpm install
    pnpm run build
    pnpm run packageQuick
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}