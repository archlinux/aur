# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eagle-animation-bin
_pkgname="Eagle Animation"
_appname="@brick-a-brack${pkgname%-bin}"
pkgver=2.6.2
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
sha256sums=('a16960c812d9e863d3f6413eb0c8e50c810d991a73dac58fdec02433c9b90edf'
            '61d56055897e9d71d68e185ac2de7c4cb2fbca16eb3fb0091703612c113441f3')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
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