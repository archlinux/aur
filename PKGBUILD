# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=swc_mclauncher
pkgname="${_pkgname//_/-}-bin"
_appname="SWC Minecraft Launcher"
pkgver=1.1.12
_electronversion=28
pkgrel=1
pkgdesc="Quickly and easily launch Software City's Minecraft-Modpacks through this beautiful and custom Minecraft Launcher!"
arch=('x86_64')
url="https://projects.software-city.org/p/mc-launcher"
_ghurl="https://github.com/Davis-Software/swc_mclauncher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Davis-Software/swc_mclauncher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('de1ec724f3d00717d3354232399602b68eaec067deb9a842c12d7a35e50d6d23'
            '2fc239445e58117449b5049215f6540a4f37dd25e4ed79a7325b57e1406c1437'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {   
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}//LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}