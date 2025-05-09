# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
_zhsname='摸鱼派'
pkgver=1.3.9
_electronversion=16
pkgrel=2
pkgdesc="The new client of Fishpi.(Prebuilt version.Use system-wide electron).摸鱼派新版客户端"
arch=('x86_64')
url="https://fishpi.cn"
_ghurl="https://github.com/imlinhanchao/fishpi-desktop"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/imlinhanchao/fishpi-desktop/master/build/icons/256x256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('d3c750f73de76ef89044e098d114226c459e2ff2211ae619590f7c228dc38ff0'
            'c8d477f31fadf5c61c54afbc28ddf06af73dfa062b53ce70c47e1092eb05bc94'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}-app/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    sed -i "5i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}