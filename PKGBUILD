# Maintainer: Anton Reshetov
pkgname=masscode-bin
_pkgname=massCode
pkgver=3.10.0
_electronversion=16
pkgrel=3
pkgdesc="A free and open source code snippets manager for developers"
arch=('x86_64')
url="https://masscode.io/"
_ghurl="https://github.com/massCodeIO/massCode"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'squashfs-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}.snap::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.snap"
    "${pkgname%-bin}.sh"
)
sha256sums=('d4e9aebeabac38aba5180a89083c25ea2e53028ce39a44d57a058d8d76232d6d'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    unsquashfs "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}