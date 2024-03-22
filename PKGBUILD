# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glyphr-studio-desktop-bin
_appname="Glyphr Studio"
pkgver=0.6.0
_electronversion=28
pkgrel=3
pkgdesc="A desktop client for Glyphr Studio built in electron.Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="https://www.glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-Desktop"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
provides=("${pkgname%-desktop-bin}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-desktop-bin}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('b156bd22d1864c71ddb5063c17f405d1340760207cf15973082e6d072e55c317'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\"|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}