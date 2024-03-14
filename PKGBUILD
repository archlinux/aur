# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforcenow-electron-bin
_appname="com.github.hmlendea.${pkgname%-bin}"
pkgver=2.0.1
_electronversion=27
pkgrel=4
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python>3'
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('43ce97be4029df53b5f8e7d3a8d93c2a6857a69aaf4213be4f4a6dfd0432d75e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|nvidia|${pkgname%-bin}|g" \
        -i "${srcdir}/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}