# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="drawio"
pkgname="${_pkgname}-desktop-electron-bin"
pkgver=21.6.1
pkgrel=1
pkgdesc="Diagram drawing application built on web technology.Use system electron."
arch=('x86_64')
url="https://www.diagrams.net/"
_githuburl="https://github.com/jgraph/drawio-desktop"
license=('Apache')
conflicts=("${pkgname%-electron-bin}" "${_pkgname}")
depends=('electron')
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('deb2d2aed610fcaa2dacce1eca6ed99b4b1ceead5c426febf483f3fddbb0279a'
            '1ac764b2ea323f1615b8dc2d77c62cc32393e7c6733d911026b8ac39e9e3d58f')
prepare() {
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${_pkgname}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
}