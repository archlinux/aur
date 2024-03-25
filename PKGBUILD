# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=poddycast-bin
_pkgname=Poddycast
pkgver=0.12.0
_electronversion=22
pkgrel=1
pkgdesc="A Podcast app made with Electron, lots of ❤️ and ☕️"
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://github.com/MrChuckomo/poddycast"
license=('GPL-3.0-only')
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
    '!strip'
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-x64.zip")
sha256sums=('dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('6f34223f142ee046b013ec6729c3b949872f6da92933740e4ea9e7f2443386c6')
sha256sums_armv7h=('0a540b05f93c2f05e690eae2bad71b75ac3b810f38a00608047312325f233a9d')
sha256sums_x86_64=('bdc260ad416063fb3b4c97b6cbe21c7fc66c4fddee08e07f5f17cd5c44c6bf59')
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
    cp -r "${srcdir}/Poddycast-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/resources/app/img/${pkgname%-bin}-app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}