# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blockyfish-client-bin
_pkgname="Blockyfish Client"
pkgver=3.2.1
_electronversion=30
pkgrel=1
pkgdesc="A custom desktop client for deeeep.io v4 with some improvements. Made by pi."
arch=("x86_64")
url="https://blockyfish.vercel.app/"
_ghurl="https://github.com/blockyfish-client/desktop-client"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}.tar.xz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/blockyfish-client/desktop-client/v${pkgver}/src/icons/256x256.png"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('17abae81f7d10fd18d447ebebfa8377afc15abd3739c7f5c2b70e9bfe9a71a81'
            'a12cbee4d98a5ce986a40d133219d735433edd94d858fc86babe0868e5e87145'
            'faa003033e5b2e0b9728cc4ac93eefd26a223a8cd1c6788eb1912e3537cf2765'
            '05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}