# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="rambox-appimage"
pkgver=2.1.3
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
sha256sums=('c2f8c2af553eff5fc6b5e6cc3562638b3cde82a67ec165d4ae63ac858b4cabaa'
            'f921b22ff50ad1a50faf4b670991bf2abab7f211c0c682cdeef9f69ac508817f')
   
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