# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=y2mp3-bin
pkgver=2.5.9_alpha
pkgrel=1
pkgdesc="An Electron app to download youtube playlist"
arch=('x86_64')
url="https://github.com/moshfeu/y2mp3"
license=('MIT')
depends=('at-spi2-core' 'cairo' 'glib2' 'libcups' 'gtk2' 'libxcb' 'libxfixes' 'expat' 'libdbusmenu-glib' 'mesa' 'bash' 'gdk-pixbuf2' \
    'libdrm' 'libxext' 'pango' 'libxcomposite' 'libxkbcommon' 'libxrandr' 'nss' 'gcc-libs' 'gtk3' 'nspr' 'libxdamage' 'dbus-glib' \
    'dbus' 'alsa-lib' 'libx11' 'glibc' 'hicolor-icon-theme')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}.AppImage"
  "LICENSE::https://raw.githubusercontent.com//moshfeu/y2mp3/master/LICENSE")
sha256sums=('9acdbb1535557d818eb4b4f86b4e27cf6c442cd1f66101530c33e200eaf66b2e'
            'e38ba30feb86e7387a43e735f2b65cf072436b3af6b3333abb4e6c460e6622fe')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Music|AudioVideo|g" -i "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}