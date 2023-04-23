# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="cerebro-appimage"
pkgver=0.11.0
pkgrel=2
pkgdesc="An open-source launcher to improve your productivity and efficiency"
arch=('x86_64')
url="https://www.cerebroapp.com"
_githuburl="https://github.com/cerebroapp/cerebro"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Cerebro-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('fab8c0328408dca4e61c6167c85a1edb4a88ac0122d032f792c227172ebbecff'
            '9f617ac32be4499f5c478c563a69a202d3c24dbda80b1cb36ea5a2230b40733c')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/cerebro.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}