# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thoughts-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="一个还算强大的Web思维导图。A relatively powerful web mind map."
arch=("x86_64")
url="https://wanglin2.github.io/mind-map/#/index"
_ghurl="https://github.com/wanglin2/mind-map"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron'
    'hicolor-icon-theme'
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/electron_${pkgver}/-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/wanglin2/mind-map/electron_${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f7b73075f4cdd8e50ec494190d0ba5c8c7d72f470a9d3544b9ad04ac9f69ab2'
            '8a19b651678a6a644640524d984ed89d0b9a78c662545715218a05130c7329c7'
            'c36118c1c69c968ba18d7be76b0869e0b15668b678f234bb8749d47f43dda039')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utilities|Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}