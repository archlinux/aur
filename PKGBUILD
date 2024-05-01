# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=m3u8downloader-bin
_pkgname="M3U8 Downloader"
pkgver=0.6.3
_electronversion=28
pkgrel=1
pkgdesc="Yet another m3u8 downloader"
arch=("x86_64")
url="https://github.com/gonwan/m3u8-downloader"
license=('Apache-2.0')
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
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/gonwan/m3u8-downloader/v${pkgver}/icons/icon256x256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('3a3fc016328d853d1048f99aad82c3de80d21dfd8d4d18bcc2d64c1a913ef4af'
            'c42b28b97e0485bf0298aac09ef9f9be169682b5467d8e3eb6334bd2b31129b3'
            '61d56055897e9d71d68e185ac2de7c4cb2fbca16eb3fb0091703612c113441f3')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-v${pkgver}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-v${pkgver}-linux-x64/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" -t "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}