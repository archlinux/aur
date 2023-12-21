# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.5.3
pkgrel=2
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_ghurl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'gtk3'
    'cairo'
    'gdk-pixbuf2'
    'harfbuzz'
    'pango'
    'libepoxy'
    'libayatana-appindicator'
    'libdbusmenu-glib'
    'fontconfig'
    'libappindicator-gtk3'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('3dd491ffd2bdc7e23a08ea1b15a6182a67d7e86ce366ae0ab8ec2a4ac4b54776'
            '64c7bfe7e80844ee07bf8fb97763eae06c6404967a1f6bb21b214295e0919b16')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|com.${pkgname%-bin}.${_pkgname}|${pkgname%-bin}|g" \
        -e "s|Internet|Network;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/com.${pkgname%-bin}.${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}