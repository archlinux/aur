# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koishi
pkgname="${_pkgname}-desktop-bin"
_appname="chat.${_pkgname}.desktop"
pkgver=0.11.3
pkgrel=1
pkgdesc="Launch Koishi from your desktop"
arch=('x86_64')
url="https://koishi.chat/manual/starter/"
_ghurl="https://github.com/koishijs/koishi-desktop"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.zip")
depends=(
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.svg::https://raw.githubusercontent.com/koishijs/koishi-desktop/v${pkgver}/packages/assets/${_pkgname}.svg"
    "${pkgname%-bin}.sh"
)
sha256sums=('d1f8cc41655433e5245c2ad028e7db45bc25941a03ea7cfed21ebe635058bc8e'
            'ac9209c0944853d0329ce23d150fb73a7859c41f5a3170f8f970dc9b955ffc6f'
            '690b0ed85633e2690d22e31a799f329758d08e5c23a583d16a26aab8caa3c88d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|koi|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname "${_pkgname}-desktop-bin" --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}