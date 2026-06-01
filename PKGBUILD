# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=warcraftlogsuploader
pkgver=9.3.61
pkgrel=1
pkgdesc="warcraftlogs.com desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
conflicts=("warcraftlogsuploader")
url="https://warcraftlogs.com/"
source=("${pkgname}-v${pkgver}.AppImage::https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v9.3.61/warcraftlogs-v9.3.61.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the WarcraftLogs binary, to avoid breakage on updates
sha512sums=('bf4bbb5fbacc42bb8f0bb2047312a399cce2965b0b91205ee092212fb06c88d0bb9aa10fe556ca8715bb9c0427e6e26ff9866150b7da5d5927da1bf833c1019e'
            '1f8d504fb27e815f7efcc8e97672bad12f531d171ab8a08c49439fb4ee63b07e9355c49e56b5fb2eb2f6d202ce56a0526b609fef4b6209832026709002eba22a')

prepare() {
    chmod +x "${srcdir}/${pkgname}-v${pkgver}.AppImage"
    "${srcdir}/${pkgname}-v${pkgver}.AppImage" --appimage-extract >/dev/null
}

build() {
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${pkgname}' %U/' "${srcdir}/squashfs-root/Warcraft Logs Uploader.desktop"
    sed -i 's/Icon=.*/Icon='${pkgname}'/' "${srcdir}/squashfs-root/Warcraft Logs Uploader.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm755 "${srcdir}/start" "${pkgdir}/usr/bin/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -m644 "${srcdir}/squashfs-root/Warcraft Logs Uploader.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -m644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/Warcraft Logs Uploader.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -m644 ${srcdir}/squashfs-root/LICENSE.* ${srcdir}/squashfs-root/LICENSES.* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
