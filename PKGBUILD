# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rats-search-bin
_pkgname='Rats on The Boat'
pkgver=1.11.0
_electronversion=24
pkgrel=9
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/DEgITx/rats-search"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/DEgITx/rats-search/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ed0b2f2a13335a851c2fa728a4b218b5f28dd59881c4934b56c5124f2860058e'
            'fa6a25af037d88ee811669579da9674e5694611599600b11e691115054f6fe2f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/app" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{icons,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/x64/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}