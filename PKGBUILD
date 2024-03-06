# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yesplaymusic-bin
_pkgname=YesPlayMusic
pkgver=0.4.8
_subver=2
_electronversion=13
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器。"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://music.qier222.com/"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
    "${pkgname%-bin}osd-electron"
    "${pkgname%-bin}osd-origin"
    "r3play"
    "r3playx"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver}-${_subver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('3cfd1aa726d2391aa578e068825760215d6d619a9aa3c919e3be26b80103a5dd')
sha256sums_armv7h=('13ccd225abbd4d5beb6fcee95648f5aae551809ffd1eefe1b37cf446980d5ad3')
sha256sums_x86_64=('8935a2fad64651053b27599c98c76559748aa581b2e263007aaf4237d7e19d9f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Music;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    for _icons in 16x16 24x24 32x32 48x48 64x64 88x88 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}