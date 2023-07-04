# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=antares-sql-appimage
pkgver=0.7.12
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=('!strip')
conflit=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_x86_64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE")
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613')
sha256sums_aarch64=('698664c5edc495bd44e94a84b3721cd27473556034e37d1ad48d2e6e1e34bfae')
sha256sums_armv7h=('33b792372dd840f4dc4a3fc71724eafa29dd8091ed70d622aed379d5aee31647')
sha256sums_x86_64=('6adea55c55e308b4a55458007851432ea486d5537bb7bd9049cb834781d6430d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-sql-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-sql-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-sql-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}