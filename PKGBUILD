# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=csbooks-bin
_pkgname=csBooks
pkgver=8.5.0
_electronversion=13
pkgrel=2
pkgdesc="A smart book management and reading software,also a PDF reader, EPUB reader, MOBI reader and DJVU file reader.(Prebuilt version.Use system-wide electron)"
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
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('499b041b365a876ed3d204d2da5dfe795ca43981299689ac53d3f3edce28a435'
            'a54c7d4ad986843b71f0b31fc110e5c5b62634518198731207e503e8642f5d4b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}