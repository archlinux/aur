# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=gotify_tray
pkgname="${_pkgname//_/-}-bin"
pkgver=0.5.2
pkgrel=4
pkgdesc="Cross-platform desktop client for receiving messages from a Gotify server"
arch=('x86_64')
url="https://github.com/seird/gotify-tray"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-webengine'
    'qt6-base'
    'qt6-svg'
    'qt6-wayland'
    'python-pyqt6'    
    'gtk3'    
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64_bookworm.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('1c98ee2d33ea2102f983ebeed64674007c661560e9bf46dd1aa6a6ec09f43187'
            '429ec798aa14c7f36a8cb8064b0ee057aff35d62eec96dcec866ff877d6380d2')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|Exec=${pkgname%-bin}|g;s|Icon=/usr/share/icons/${pkgname%-bin}.ico|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname//_/}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//_/}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}/gui/images/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}