# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=spearmint
pkgname="${_pkgname}-test-bin"
pkgver=0.14.0
pkgrel=2
pkgdesc="Testing, simplified. || An inclusive, accessibility-first GUI for generating clean, semantic Javascript tests in only a few clicks of a button."
arch=('x86_64')
url="https://www.spearmintjs.com/"
_githuburl="https://github.com/open-source-labs/spearmint"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('bash' 'electron24')
source=("${pkgname%-test-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/open-source-labs/spearmint/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b2c06f2d5ee8049c7d4c365ae89b1cdae725286865882b2686678bd66de9ae62'
            '32c14cbaf21ae0dffb9d2403e379c0eaec5691ab122b7c9c365cd50706736029'
            'b2c1f7ca2636230c8b6227e1f388ab809a94403ac6417c1eb82f46dd2d7ac249')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}