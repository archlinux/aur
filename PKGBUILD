# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=devsidecar-appimage
_appname="@docmirrordev-sidecar-gui"
pkgver=1.7.3
pkgrel=1
pkgdesc="开发者边车，github打不开，github加速，git clone加速，git release下载加速，stackoverflow加速"
arch=('x86_64')
url="https://github.com/docmirror/dev-sidecar"
license=('MPL2')
provides=()
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/DevSidecar-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/docmirror/dev-sidecar/master/LICENSE")
sha256sums=('4a611ca14165fe1b84b4d8d02bc0db0c15cf3446193def69ff3f474e2b8128e3'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/devsidecar.AppImage|g;s|@docmirrordev-sidecar-gui|devsidecar|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 0x0 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}