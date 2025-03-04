# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=desktop-schedule-bin
_pkgname="Desktop.Schedule"
pkgver=1.1.0
_electronversion=16
pkgrel=8
pkgdesc="A concise yet elegant desktop course schedule.(Prebuilt version.Use system-wide electron)简洁而不失优雅的桌面课程表"
arch=('x86_64')
url="https://github.com/TimFang4162/desktop-schedule"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-setup-${pkgver}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/TimFang4162/desktop-schedule/master/build/icons/256x256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('fdfaecc9d2d63d0e9c9b29f098eea1609e0663ad7611ff2b097c25621ed0add2'
            'f121ff2d43234e56c2d88542e89f68464464ecf51ba6e0b11ff24019f6599e6f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgname}" --categories="Utility" --name="${_pkgname//./ }" --exec="${pkgname} %U"
    sed -i "3i\Name[zh_CN]=桌面课程表" "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}"
}