# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=video-chapter-injector-bin
_pkgname="Video Chapter Injector"
pkgver=1.0.0
_electronversion=29
pkgrel=1
pkgdesc="An electron app which quickly allows you to inject non-linear video editor markers into video files as chapter points."
arch=("x86_64")
url="https://github.com/markbattistella/video-chapter-injector"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/markbattistella/video-chapter-injector/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a82e26951b197e7bd76b8d59ba8b9d648729d2a40fa5169a6ef984b37985b171'
            '68771d03435f519db8e096bd17e4e9ca5252b6508b5c61cc14d26a6578a757d2'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-linux/resources/app"  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}-linux/resources/app/data/icons/app-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}