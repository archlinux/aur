# Maintainer: Deltachaos <mr@deltachaos.de>

pkgname=warcraftlogsuploader
pkgver=8.17.101
pkgrel=1
pkgdesc="warcraftlogs.com desktop client for Linux"
arch=('x86_64')
depends=("fuse2")
conflicts=("warcraftlogsuploader")
url="https://warcraftlogs.com/"
source=("${pkgname}-v${pkgver}.AppImage::https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v8.17.101/warcraftlogs-v8.17.101.AppImage"
        'start')
license=('custom' 'MIT' 'custom:chromium-licenses')
options=(!strip)
# Skip checksum check for the WarcraftLogs binary, to avoid breakage on updates
sha512sums=('6b17a4481b30f338fcc2408951de29f0533403d96d558abddf104bd0f27e1caedf9b94da036f225defb7bda22e76523621e52a92d4cefaba409a936add6dad08'
            '1f8d504fb27e815f7efcc8e97672bad12f531d171ab8a08c49439fb4ee63b07e9355c49e56b5fb2eb2f6d202ce56a0526b609fef4b6209832026709002eba22a')

package() {
    cd "${srcdir}"
    chmod +x "${srcdir}/${pkgname}-v${pkgver}.AppImage"
    "./${pkgname}-v${pkgver}.AppImage" --appimage-extract >/dev/null
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/'${pkgname}' %U/' squashfs-root/warcraftlogs.desktop

    install -Dm755 "${pkgname}-v${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm755 "start" "${pkgdir}/usr/bin/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/warcraftlogs.desktop" "${pkgdir}/usr/share/applications/"
    for i in ${srcdir}/squashfs-root/LICENSE.* ${srcdir}/squashfs-root/LICENSES.*; do
      cp --no-preserve=mode,ownership "${i}" "${pkgdir}/usr/share/licenses/${pkgname}"
    done
}
