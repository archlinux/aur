# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eagle-animation-bin
_pkgname="Eagle Animation"
_appname="@brick-a-brack${pkgname%-bin}"
pkgver=2.8.0
_electronversion=30
pkgrel=1
pkgdesc="An awesome, free and open-source animation software."
arch=('x86_64')
url="https://brickfilms.com/"
_ghurl="https://github.com/brick-a-brack/eagle-animation"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('84ffbea20679b50697da08d33133d2e9add0c63223c38180237db27ec0f130c4'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|@brick-a-brack|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"\/opt\/${_pkgname}\/${_appname}\"|${pkgname%-bin}|g" \
        -e "s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -e "s|Photography|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}