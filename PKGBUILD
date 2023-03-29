# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=cerebro
pkgname="${_pkgname}-appimage"
pkgver=0.11.0
pkgrel=1
pkgdesc="An open-source launcher to improve your productivity and efficiency"
arch=('x86_64')
url="https://www.cerebroapp.com"
_githuburl="https://github.com/cerebroapp/cerebro"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=(cerebroapp)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Cerebro-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('fab8c0328408dca4e61c6167c85a1edb4a88ac0122d032f792c227172ebbecff'
            '9f617ac32be4499f5c478c563a69a202d3c24dbda80b1cb36ea5a2230b40733c')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/cerebro.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}