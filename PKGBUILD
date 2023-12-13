# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.5.2
pkgrel=1
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
sha256sums=('aebc74a14b65f8efbe2ea2815be838a08e2338d1f5f21656a88e438819d362f9'
            '265b344a9c97f52feffb1c9fb07fee8919e31abe8e9e15aed6ccf76e3c49440c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${pkgname%-bin}|g" \
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