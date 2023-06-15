# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ooniprobe-desktop-appimage"
pkgver=3.9.0
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=("x86_64")
url="https://github.com/ooni/probe-desktop"
license=('BSD3-Clause')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/ooniprobe-desktop-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ooni/probe-desktop/master/LICENSE.md")
sha256sums=('0c25e895bba15584d2d064d78d80020ff80eeb51f3e03bee92f0485a28e0fa8a'
            '1fc3f6a8bf2909bfaad6d6f4825c8e8b6dfed17e3b5270a9fd060d6de7938f8d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}