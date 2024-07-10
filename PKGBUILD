# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=iptvnator
pkgname="${_appname}-electron-bin"
_pkgname=IPTVnator
pkgver=0.15.1
_electronversion=27
pkgrel=2
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more.Use system electron."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://iptvnator.vercel.app/"
_ghurl="https://github.com/4gray/iptvnator"
license=('MIT')
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
depends=(
    "electron${_electronversion}"
    'mpv'
)
source_aarch64=("${_appname}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_arm64.deb")
source_armv7h=("${_appname}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_armv7l.deb")
source_x86_64=("${_appname}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/4gray/iptvnator/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('9eced4f3ef6d5be90005f4be4f070ebac2ac4a2af056afbde979eda0e6c9d067')
sha256sums_armv7h=('5d313f5b5b421dc257879895960903ec5e2e36328a3013911eefcc8e43f73663')
sha256sums_x86_64=('c03cd0dab0d4b1ac63f0cb26e30deeb2d1335f217d747ecd4a5fa7819a735986')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin}|g;s|Video|AudioVideo|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for icons in 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${_appname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}