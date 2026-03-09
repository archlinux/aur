# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.9.2
pkgrel=1
pkgdesc="High speed downloader that supports all platforms.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://gopeed.com/"
_ghurl="https://github.com/GopeedLab/gopeed"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libdbusmenu-glib'
    'libayatana-appindicator'
    'libayatana-indicator'
    'ayatana-ido'
    'libkeybinder3'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.rpm")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('3ecb73c33a5bcd3ee1728fa47394ab6bcece5482683715d37a2165c10a0e53ae')
sha256sums_x86_64=('279d11bfac29a2ed99eb3d062c63be2a479e64f5a1a0628c84119cfaf43975a9')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        3i\GenericName=${_pkgname} Download Manager
        3i\MimeType=x-scheme-handler\/gopeed;x-scheme-handler\/magnet;application\/x-bittorrent;
        3i\Categories=Network;Utility;
        3i\Keywords=Application;DownloadManager;Network;Utility;
        3i\StartupNotify=False
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
