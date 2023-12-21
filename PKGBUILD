# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
pkgver=1.3.5
_electronversion=16
pkgrel=7
pkgdesc="摸鱼派新版客户端"
arch=('x86_64')
url="https://fishpi.cn"
_ghurl="https://github.com/imlinhanchao/fishpi-desktop"
license=('custom')
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
    "LICENSE-${pkgver}.html::${url}/privacy"
    "${pkgname%-bin}.sh"
)
sha256sums=('87dad81ad2f57bb136254df8c52e06613e24d296ce3aa39b722b6271dd6c44f5'
            'c8d477f31fadf5c61c54afbc28ddf06af73dfa062b53ce70c47e1092eb05bc94'
            '297384f1b1b182685453ce1c25ec88de538555fe88ce9bf97545525e31ea357e'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    sed '5i Name[zh_CN]=摸鱼派' -i "${srcdir}/${pkgname%-bin}.desktop"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}