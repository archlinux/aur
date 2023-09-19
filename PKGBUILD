# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=desktop-schedule-bin
_pkgname="Desktop.Schedule"
pkgver=1.0.6
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
sha256sums=('21eddf849102ed23f12fc6d6887aaefa6dd25d4ffa4a431faf23b1beadba95ef'
            'd76c98caf36bd316cc607b893d1b11b23dbeeda19b9d684eeba566d74cf7590a'
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