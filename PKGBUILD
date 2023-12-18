# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deckboard-bin
_pkgname=Deckboard
pkgver=3.0.0_rc2
_electronversion=4
pkgrel=1
pkgdesc="Control your PC with your phone in easy way possible."
arch=(
    'i686'
    'x86_64'
)
url="https://deckboard.app/"
_ghurl="https://github.com/rivafarabi/deckboard"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('ba4ed4aaf2c44af5118b06a3099a92ef3bdc969ed964ad508a857d37ae56fd3d')
sha256sums_i686=('292fddb562e10a81fa5bb7b53b6d20860e10203397f79e42bc65d4f9b2cab846')
sha256sums_x86_64=('d9aaca12f16e6c036d332497766fe7e6a8c1041cff7d179ebeca39c3f0bacb0f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/"{app.asar,database.db} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/src" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}