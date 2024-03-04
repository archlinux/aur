# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mapeo-desktop-bin
_pkgname=Mapeo
pkgver=5.6.2
_electronversion=9
pkgrel=5
pkgdesc="An offline map editing application for indigenous territory mapping in remote environments."
arch=('x86_64')
url="https://mapeo.app/"
_ghurl="https://github.com/digidem/mapeo-desktop"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
    'nodejs'
    'python>3'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('7bd9620e618b323182974dcc3df1a4bf0b4902f2622ac5af3728ea3d9909cb52'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app"
    sed "s|= isDev|= !isDev|g;s|temp-resources||g" -i "${srcdir}/app/config.js"
    cp -r "${srcdir}/opt/${_pkgname}/resources/presets" "${srcdir}/app"
    rm -rf "${srcdir}/app/node_modules/sodium-native/tmp"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}