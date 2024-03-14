# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fontastic-bin
_pkgname=Fontastic
pkgver=0.2.0
_electronversion=25
pkgrel=3
pkgdesc="A stunning font management and cataloging application."
arch=('x86_64')
url="https://github.com/tomshaw/fontastic"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tomshaw/fontastic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3b34a974d7da78f9621b02e11a35c00d9f81a19ec42ed1dddfc4f4d59d67d962'
            'd461d5796257402081b89cae64365068a66d193696f7c64cb7e6fd307b4a48d9'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/bin/activator" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    for _icons in 16x16 32x32 192x192 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"\
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}