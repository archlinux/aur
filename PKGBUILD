# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord
_pkgname=ArmCord
pkgver=3.2.4_e27
pkgrel=1
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('any')
url="https://armcord.app/"
_githuburl="https://github.com/ArmCord/ArmCord"
license=('custom:OSL3')
conflicts=("${pkgname}")
depends=('bash' 'electron27')
makedepends=('gendesk' 'pnpm>=7.13.4' 'nodejs>=18.0.0' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('bfc634b317dc1ce25c6e606af82d0c5a7d1d913aade3ce6542682eb9611a2a26'
            '5ec544b71d34af88c8368f696853f6d3bde4cbc1f338885566e9c7d64b54cca3')
prepare() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    pnpm install
    sed '/deb/d;/tar.gz/d;/rpm/d' -i package.json
    pnpm run packageQuick
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}