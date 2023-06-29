# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="rambox-appimage"
pkgver=2.1.4
pkgrel=1
pkgdesc="Free and Open Source messaging and emailing app that combines common web applications into one."
arch=('any')
url="https://rambox.app/"
_githuburl="https://github.com/ramboxapp/download"
license=('custom')
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-pro" "${pkgname%-appimage}-pro-bin")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Rambox-${pkgver}-linux-x64.AppImage"
    "LICENSE.html::${url}/eula/")
sha256sums=('dfc13d6233faae288abdd0e8bd3b227a55a2dc83bbe20eabee2bbb195f05f850'
            '7488a4177a1a7b6a62c7f08e5c2bdcd8472836456b3eb657d2840b4b4ccff1ff')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/rambox.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}