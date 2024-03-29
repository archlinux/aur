# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blockyfish-client-bin
_pkgname="Blockyfish Client"
pkgver=3.1.4
_electronversion=24
pkgrel=1
pkgdesc="A custom desktop client for deeeep.io v4 with some improvements. Made by pi."
arch=("x86_64")
url="https://blockyfish.vercel.app/"
_ghurl="https://github.com/blockyfish-client/desktop-client"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}.tar.xz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/blockyfish-client/desktop-client/v${pkgver}/src/icons/256x256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('381319fd34e8b33aa299487a275f990172a051a6dc9edb1b38f41db0ee9d0ad0'
            'a12cbee4d98a5ce986a40d133219d735433edd94d858fc86babe0868e5e87145'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}