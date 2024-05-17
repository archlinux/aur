# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisqi-bin
_pkgname=Brisqi
pkgver=0.11.1
_electronversion=25
pkgrel=6
pkgdesc="Offline-first personal Kanban app."
arch=('x86_64')
url="https://brisqi.com/"
_ghurl="https://github.com/Brisqi/releases"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-setup-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}.html::${url}/terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('1861484c91a4222861089b1da9d850c1d6c8b68a1ea47cc823768ca7792196b2'
            '4080d883dce81c416f8cd407e191345d0f4bd4178c6923e34e46e23fa2049e63'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 38x38 64x64 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}//LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}