# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=desktop-schedule-bin
_pkgname="Desktop.Schedule"
pkgver=1.0.4
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
sha256sums=('2ad0e4e1f2469e00d64538fad842889d800c89dabbd1e7dfeecf6f30fb0abb7a'
            'd76c98caf36bd316cc607b893d1b11b23dbeeda19b9d684eeba566d74cf7590a'
            '703b628c8e5d45e0c44123bc0546e7eaf01572640a6383eb8b5a6343305a223a')
prepare() {
    asar e "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/app.asar"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/"*.* -t "${srcdir}/app.asar.unpacked/dist/extraResources"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "${_pkgname//./}桌面课程表" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}