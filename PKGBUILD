# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nteract-appimage"
pkgver=0.28.0
pkgrel=3
pkgdesc="An open-source organization committed to creating fantastic interactive computing experiences that allow people to collaborate with ease."
arch=("x86_64")
url="https://nteract.io/"
_githuburl="https://github.com/nteract/nteract"
license=("BSD3-Clause")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('85ee58064e301b9804fc33a5d88988428737f958de9994eada09d100f7d59dc0'
            'd2c4e0350578376f33f783b98c686c1074fac325c19035d8c727875703d82018')
     
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/nteract.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}