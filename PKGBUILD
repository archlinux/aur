# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vic-diary-bin
_pkgname='维克日记'
pkgver=0.6.5
_electronversion=22
pkgrel=1
pkgdesc="Support markdown syntax input, WYSIWYG cross-platform diary software(Prebuilt version)"
arch=('x86_64')
url="https://vic-diary.netlify.app/"
_ghurl="https://github.com/vo-soft/vic-diary-releases"
_giteeurl="https://gitee.com/vo-soft/vic-diary-release"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_giteeurl}/releases/download/latest/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/vo-soft/vic-diary-releases/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('eaddcf6ccee9909ea12f11646ec99b27d3c0d5c90b01625ed9234f65b045f6bb'
            '9c2cde6ad2685c66d9fb8d476cff8646f499028c866b8c61c436a69f72e21ee1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Utility;Utility/Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}