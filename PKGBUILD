# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=video-hub-app-bin
_pkgname=Video.Hub.App
pkgver=3.2.0
pkgrel=3
pkgdesc="The fastest way to browse and search for videos on your computer. Think of it like YouTube for videos on your computer: browse, search, and preview."
arch=('x86_64')
url="https://videohubapp.com/"
_githuburl="https://github.com/whyboris/Video-Hub-App"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'hicolor-icon-theme'
    'electron22'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}.3.Demo-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/whyboris/Video-Hub-App/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5264acfd9d4e3ca0ce7332acaeb74431c49b48e9f50f01bd9f45074ea323577b'
            '096d751c3b4fea8ec7f2c8600137020ac6d1ab74b27a6353d1a3dca4271bc9f0'
            '7cdf1bff566baf160bcd1265d44614c1861b097db8aae0f688eb2416b26d23a4')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${pkgname%-bin}-3|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{assets,app.asar.unpacked,remote} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-3.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}