# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ngrev-bin
pkgver=0.0.35
pkgrel=5
pkgdesc="Tool for reverse engineering of Angular applications"
arch=('x86_64')
url="https://github.com/mgechev/ngrev"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'electron11'
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mgechev/ngrev/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('c9f1d0212edf967c97a2e29610712b4c5f14ca9e58a9c1fbb39be2bfbe3907b1'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4'
            '9d9aa67a5dc45cc31f768c5c3323b90377a1d7da1fb293562a8ad174caffaa1f')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}