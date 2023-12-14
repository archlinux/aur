# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=spearmint
pkgname="${_pkgname}-test-bin"
pkgver=0.14.0
_electronversion=24
pkgrel=3
pkgdesc="Testing, simplified. || An inclusive, accessibility-first GUI for generating clean, semantic Javascript tests in only a few clicks of a button."
arch=('x86_64')
url="https://www.spearmintjs.com/"
_githuburl="https://github.com/open-source-labs/spearmint"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libxcb'
    'nss'
    'python'
)
source=(
    "${pkgname%-test-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/open-source-labs/spearmint/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b2c06f2d5ee8049c7d4c365ae89b1cdae725286865882b2686678bd66de9ae62'
            '32c14cbaf21ae0dffb9d2403e379c0eaec5691ab122b7c9c365cd50706736029'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}