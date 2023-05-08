# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="runjs-appimage"
pkgver=2.9.0
pkgrel=1
pkgdesc="A JavaScript playground for macOS, Windows and Linux. Write code with instant feedback and access to Node.js and browser APIs."
arch=('x86_64')
url="https://runjs.app"
_githuburl="https://github.com/lukehaas/RunJS"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/RunJS-${pkgver}.AppImage"
    "LICENSE.html::${url}/eula")
sha256sums=('57f64aee46892b98c8763859ba8ddd0fb87b7880b8d838939f131faceb203d09'
            'e639a605e3d9bc1d50744a7d095f85667e3b83bad598ba68f52ae062ac19abb3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/runjs.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}