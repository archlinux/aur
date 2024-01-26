# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yakuza-bin
pkgver=0.2.1
_electronversion=28
pkgrel=1
pkgdesc="An extensible linux application launcher"
arch=('x86_64')
url="https://github.com/fzdwx/yakuza"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'dbus-glib'
    'libdbusmenu-glib'
    'gtk2'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-bin}-0.1.0.AppImage"
    "yactrl-${pkgver}::${url}/releases/download/${pkgver}/yactrl"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fzdwx/yakuza/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ff32a049359d95b2180e039f36baaa2357d1a3becd977659a86085a3bae21ca0'
            '9e157a0cd2aa43b860a2837670b054a67f0e5af155b1ed889fc63a24a1df3d00'
            '9e05d771f47c0447e9147319523e1a2de79538b9e85f7ad1f4d657ac56648b38'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/yactrl-${pkgver}" "${pkgdir}/usr/bin/yactrl"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}