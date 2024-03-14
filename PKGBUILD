# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=notesnook
pkgname="${_pkgname}-electron-bin"
pkgver=2.6.16
_electronversion=25
pkgrel=2
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote.Use system-wide Electron"
arch=(
    'aarch64'
    'x86_64'
)
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'fuse2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.AppImage")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('4273dcd9c522afabdcc25d05e8370061a7755a180959534f23149fbc16b72a73')
sha256sums_x86_64=('455eb0f715e76b840291ab0bdf537976d2e87dbc65b9367d2fa574739cc3d514')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
