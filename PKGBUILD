# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=csbooks-bin
_appname=csBooks
pkgver=7.5.0
_electronversion=21
pkgrel=6
pkgdesc="A smart book management and reading software,also a PDF reader, EPUB reader, MOBI reader and DJVU file reader."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_ghurl="https://github.com/caesiumstudio/csBooks-updates"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname}-${pkgver}.pacman::${_ghurl}/releases/download/latest/${_appname}-${pkgver}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('b1dfc2d6b137580b7bba60da5d97886369170f6b38b3154ad919847b9eca7afc'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_appname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}