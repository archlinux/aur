# Maintainer: Anton Reshetov
pkgname=masscode-bin
_pkgname=massCode
pkgver=3.12.1
_electronversion=16
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://masscode.io/"
_ghurl="https://github.com/massCodeIO/massCode"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'squashfs-tools'
)
source=(
    "${pkgname%-bin}-${pkgver}.snap::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.snap"
    "${pkgname%-bin}.sh"
)
sha256sums=('efef4d857d4bfff9318577306410789c5404f5c4c12b5206eb213b1a12519fdc'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    unsquashfs -f "${srcdir}/${pkgname%-bin}-${pkgver}.snap"
    sed -i "s/\${SNAP}\/meta\/gui\/icon.png/${pkgname%-bin}/g" "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}