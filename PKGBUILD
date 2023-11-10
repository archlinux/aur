# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.4.4
pkgrel=1
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
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
    'libayatana-indicator'
    'ayatana-ido'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.deb"
)
sha256sums=('25db38d3dbc2f10dcf2c6e79e62caed4db9876001febe13ae5cd6caf071055fa')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|Utility|Network;Utility;|g" \
        -e "s|/usr/local/lib/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/usr/share/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/local/bin/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}