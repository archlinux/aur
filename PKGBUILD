# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-auto-bin
_pkgname="Clash Auto"
pkgver=2.4.8
_electronversion=21
pkgrel=5
pkgdesc="Use clash.meta & speedtest & easy to use"
arch=('x86_64')
url="https://clashr-auto.gitbook.io/"
_ghurl="https://github.com/ClashrAuto/Clashr-Auto-Desktop"
license=('LicenseRef-unknown')
providers=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-amd64_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('96580e856ec3f28b9aab5fa298e33c09f4a6b90c2033117aa9ef5030761c32c6'
            'f80acf84a87f3f50d7c4e2ed22f4d0e8b09dd98a6c26253f2524e5413771eab1')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"{command,config,language} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}