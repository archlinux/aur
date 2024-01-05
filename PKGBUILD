# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webeep-sync-bin
_appname=webeep-sync
pkgver=1.0.3
_electronversion=22
pkgrel=3
pkgdesc="Keep all your WeBeep files synced on your computer!"
arch=('x86_64')
url="https://github.com/toto04/webeep-sync"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-debian.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8e77681185c6795fbfbf038a5cde95f78c2aadf19108804fb1a4d64c6d2c615a'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 32x32 48x48 64x64 96x96 128x128 256x256;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}