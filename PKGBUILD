# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=etherealengine-control-center-bin
_appname=Ethereal-Engine-Control-Center
pkgver=0.4.3
pkgrel=1
pkgdesc="One stop solution for all your Metaverse needs. A desktop app for managing Ethereal Engine cluster. "
arch=('x86_64')
url="https://etherealengine.org/"
_githuburl="https://github.com/EtherealEngine/etherealengine-control-center"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxext' 'libx11' 'libdrm' 'pango' 'libdbusmenu-glib' 'glib2' 'cairo' 'at-spi2-core' 'libcups' 'libxfixes' 'mesa' 'nss' 'gtk3' 'glibc' 'libxdamage' \
    'nspr' 'gdk-pixbuf2' 'gtk2' 'bash' 'hicolor-icon-theme' 'alsa-lib' 'dbus' 'libxcomposite' 'libxcb' 'dbus-glib' 'gcc-libs' 'expat' 'libxrandr' 'libxkbcommon')
makedepends=('squashfuse')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/EtherealEngine/etherealengine-control-center/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8b03d5377e54ac1147da2e621ed9383d13a9b2b2860bd3ea0594404f6a5eeca5'
            'd346da664afe040f323eb3aecc74d5bb2a8b6d61a7ff53ccfaf1611add61a41d'
            'b943c211366bb9b7fa68d199a8bbec376621ab68e73fc6b84806540aeb8e6104')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"app* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 8x8 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}