# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="no-fwl-appimage"
pkgver=0.1.0
pkgrel=1
pkgdesc="NoFWL Desktop Application"
arch=("x86_64")
url="https://nofwl.com/"
_githuburl="https://github.com/lencx/nofwl"
license=('GPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/NoFWL_${pkgver}_linux_${CARCH}.AppImage.tar.gz")
sha256sums=('642d04feaf2753d534c6483acbbc232d8ac5015fe6c3b486cc287c10877fd886')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    mv "${srcdir}/${pkgname%-appimage}_${pkgver}_amd64.AppImage" "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=no-fwl|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}