# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serina-bin
_pkgname=Serina
pkgver=0.4.0
_electronversion=24
pkgrel=6
pkgdesc="GUI for create translation files for i18next.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://orn-fox.github.io/serina-1/"
_ghurl="https://github.com/ORN-Fox/serina-1"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/R${pkgver}/${pkgname%-bin}-${pkgver//./-}-linux-x64.zip"
    "${pkgname%-bin}".sh
)
sha256sums=('69d3988f02868299b31f974d1d3774431998a14a18e6469be0675211d290b524'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app/icons/icon-x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}