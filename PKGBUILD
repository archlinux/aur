# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="iptvnator-electron-bin"
pkgver=0.13.0
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more.Use system electron."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://iptvnator.vercel.app/"
_githuburl="https://github.com/4gray/iptvnator"
license=('MIT')
conflicts=("${pkgname%-electron-bin}" "${pkgname%-electron-bin}-appimage")
depends=('electron' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-electron-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/IPTVnator-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-electron-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/IPTVnator-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-electron-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/IPTVnator-${pkgver}.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/4gray/iptvnator/electron/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74'
            'c8e74aa21853464a44867923e80fb2ea137cec344a617b75c672781dfde74ada')
sha256sums_aarch64=('7604191492d8943e589be03714b2c626b641d1481514f06b972686a868f9db54')
sha256sums_armv7h=('fd7ea5414b21af7e8fb79527cf38d32c271d4505ca60f3b1c0e829fefba8fcfa')
sha256sums_x86_64=('57e690bfa3308a95bbc2da65099ee348e405625c4f07837f41e7f7f4ec674e8d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-electron-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Video|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-electron-bin}.desktop"
}
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 64x64 128x128 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
}