# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maduchat-frontend-bin
_pkgname=MaduChat
pkgver=1.2.1
_electronversion=26
pkgrel=7
pkgdesc="A chat application which has a global chat, friend system, settings and lots of other features.(Prebuilt version.Use system-wide electron)"
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
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('2325d628fc42a78a9ecd475b116c69a0c17b4d970ebe69dad83bc03c74797ffc')
sha256sums_armv7h=('9820879bc6f104683b8a447f3b799260a7740144de219040cc4406c33b9793f5')
sha256sums_x86_64=('aa15825954e758f3e41e3cd2bc806cb7bf550c9c3f35eaff69820f6356ee163b')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/maduchat-electron-frontend/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-linux-"*/resources/app/assets/icons/icon-512x512.png \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}