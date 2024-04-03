# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=thedesk
pkgname="${_appname}-client-bin"
_pkgname=TheDesk
pkgver=24.2.0
_electronversion=22
pkgrel=1
pkgdesc="Mastodon Client for PC."
arch=("x86_64")
url="https://thedesk.top/"
_ghurl="https://github.com/cutls/TheDesk"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('0631241ca3380317e2645c7e2611033b18a538f23df4f5c70d1e84f5e1987b55'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm0755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
}