# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.5.0
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
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.deb"
)
sha256sums=('cb081e39a8b7f21375a8faab74aa5315b08c6bb8f4b19aec1b8dde268c5f7d3d')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} %U|g" \
        -e "s|com.${pkgname%-bin}.${_pkgname}|${pkgname%-bin}|g" \
        -e "s|Internet|Network;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/com.${pkgname%-bin}.${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}