# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord
_pkgname=ArmCord
pkgver=3.2.5
pkgrel=1
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('any')
url="https://armcord.app/"
_githuburl="https://github.com/ArmCord/ArmCord"
license=('custom:OSL3')
conflicts=("${pkgname}")
depends=('bash' 'electron27')
makedepends=('gendesk' 'pnpm>=7.13.4' 'nodejs>=18.0.0' 'npm')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('5cb7f8cacece0c117b7fcb02de46a3059539775d875cd2ba28e6ac5d5aaed542'
            '5e0336ade88b6f7ba3020db7ac8e63b6b1387ca0f11bac523e9924a007a684a5')
prepare() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pnpm install
    sed '/deb/d;/tar.gz/d;/rpm/d' -i package.json
    pnpm run packageQuick
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}