# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord
_pkgname=ArmCord
pkgver=3.2.3
pkgrel=1
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('any')
url="https://armcord.app/"
_githuburl="https://github.com/ArmCord/ArmCord"
license=('custom:OSL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'pnpm' 'nodejs>=18.0.0')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('2687430f1a20460e7006f9378337992018dfc145ee4ee742f6cbce177e3319b1'
            'fca0ce827169aef7973195c2926ace1941afa39a8375cc2bde9dc94fe6635595')
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