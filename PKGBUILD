# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=desktop-schedule-bin
_pkgname="Desktop.Schedule"
pkgver=1.1.0
pkgrel=1
pkgdesc="A concise yet elegant desktop course schedule.简洁而不失优雅的桌面课程表"
arch=("x86_64")
url="https://github.com/TimFang4162/desktop-schedule"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-setup-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/TimFang4162/desktop-schedule/master/build/icons/256x256.png"
    "${pkgname%-bin}.sh")
sha256sums=('fdfaecc9d2d63d0e9c9b29f098eea1609e0663ad7611ff2b097c25621ed0add2'
            'f121ff2d43234e56c2d88542e89f68464464ecf51ba6e0b11ff24019f6599e6f'
            'b2dbd2571c60c57a113b92967b113e3edd0baf47898945f52b06f1e479ecefe9')
build() {
    asar e "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/app.asar"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/"*.* -t "${srcdir}/app.asar.unpacked/dist/extraResources"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    gendesk -f -n --categories "Utility" --name "${_pkgname//./}桌面课程表" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}