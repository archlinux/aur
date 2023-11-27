# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altus-bin
_pkgname=Altus
pkgver=4.8.6
pkgrel=2
pkgdesc="Desktop client for WhatsApp Web with themes, notifications and multiple account support"
arch=('x86_64')
url="https://github.com/amanharwara/altus"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('936984e708665eac38852c51c838b984e5df715bad0acc435c7cdba22f1d6914'
            '9fdd14fe0607f61c0190ac113413613872b535240123cf1f1c0d16532ac4e0c1')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" \
        -e "s|Categories=Chat;|Categories=Network;|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}