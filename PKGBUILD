# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=iptvnator-electron-bin
_appname=IPTVnator
pkgver=0.15.1
_electronversion=25
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more.Use system electron."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://iptvnator.vercel.app/"
_ghurl="https://github.com/4gray/iptvnator"
license=('MIT')
provides=("${pkgname%-electron-bin}=${pkgver}")
conflicts=("${pkgname%-electron-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source_aarch64=("${pkgname%-electron-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-electron-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-electron-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/4gray/iptvnator/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('9eced4f3ef6d5be90005f4be4f070ebac2ac4a2af056afbde979eda0e6c9d067')
sha256sums_armv7h=('5d313f5b5b421dc257879895960903ec5e2e36328a3013911eefcc8e43f73663')
sha256sums_x86_64=('c03cd0dab0d4b1ac63f0cb26e30deeb2d1335f217d747ecd4a5fa7819a735986')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_appname}/${pkgname%-electron-bin}|${pkgname%-bin}|g;s|Video|AudioVideo|g;s|Icon=${pkgname%-electron-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for icons in 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}