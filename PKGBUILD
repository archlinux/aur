# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fluent-reader-appimage
pkgver=1.1.3
pkgrel=1
pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI"
arch=('any')
url="https://hyliu.me/fluent-reader/"
_githuburl="https://github.com/yang991178/fluent-reader"
license=('custom:BSD-3-Clause')
options=(!strip)
conflits=("${pkgname%-appimage}" "${pkgname%-appimage}-electron")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/yang991178/fluent-reader/master/LICENSE")
sha256sums=('0b3be139a59f678aedd8798bff2bfa3fb23110f2e8cae0617ed3b172374c2275'
            'f3fc28705671a44a2a8293d101a51107f9ca2884da1e29fb92e0f8899490fa6c')
_install_path="/opt/appimages" 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fluent-reader.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}