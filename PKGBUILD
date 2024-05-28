# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.9.0
_electronversion=27
pkgrel=5
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.pikatorrent.com/"
_ghurl="https://github.com/G-Ray/pikatorrent"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'curl'
    'xdg-utils'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('dc77842c011acbad94507521ad3df825a431e0ae07dff9c11a011ed774b478b8')
sha256sums_x86_64=('c739f3f7a9cf68443450f16f7c370abbe2606e828f255a1e69b112a90f7f5a3e')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|com.${pkgname%-bin}.${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/linux/${pkgname%-bin}.desktop"
    sed "s|com.${pkgname%-bin}.${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/linux/${pkgname%-bin}.metainfo.xml"
    asar p "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/linux/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/linux/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}