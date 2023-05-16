# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pulsar-appimage"
pkgver=1.105.0
pkgrel=1
pkgdesc="A Community-led Hyper-Hackable Text Editor"
arch=('x86_64')
url="https://pulsar-edit.dev/"
_githuburl="https://github.com/pulsar-edit/pulsar"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Linux.Pulsar-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/pulsar-edit/pulsar/master/LICENSE.md")
sha256sums=('07699d6cb547e4f01becdeed6816b97f4a499d44b4f9839cccff350f78f4cd3e'
            '8228c15bb222358232dfd2aad1153a1fff0a44ca9155bc382858e286a9ef1182')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/pulsar.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 384x384;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}