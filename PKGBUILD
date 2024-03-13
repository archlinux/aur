# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maduchat-frontend-bin
_pkgname=MaduChat
pkgver=1.2.1
_electronversion=26
pkgrel=4
pkgdesc="A chat application which has a global chat, friend system, settings and lots of other features"
url="https://github.com/Madu-de/MaduChat"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('2325d628fc42a78a9ecd475b116c69a0c17b4d970ebe69dad83bc03c74797ffc')
sha256sums_armv7h=('9820879bc6f104683b8a447f3b799260a7740144de219040cc4406c33b9793f5')
sha256sums_x86_64=('aa15825954e758f3e41e3cd2bc806cb7bf550c9c3f35eaff69820f6356ee163b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app/assets/icons/icon-512x512.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}