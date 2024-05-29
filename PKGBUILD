# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=csbooks-bin
_pkgname=csBooks
pkgver=8.2.2
_electronversion=13
pkgrel=1
pkgdesc="A smart book management and reading software,also a PDF reader, EPUB reader, MOBI reader and DJVU file reader."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_ghurl="https://github.com/caesiumstudio/csBooks-updates"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname}-${pkgver}.pacman::${_ghurl}/releases/download/latest/${_pkgname}-${pkgver}.pacman"
    "LICENSE-${pkgver}.html::https://caesiumstudio.com/eula/license"
    "${pkgname%-bin}.sh"
)
sha256sums=('a6f544e1b9a6546701a304b651b9ab6f34b20866ad832f88378085bcc666a95e'
            '258c68aa1cfa6963640aaf3776001ff55fe13df586726af039cc31c03c06f300'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}