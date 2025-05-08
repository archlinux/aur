# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xplist-bin
_pkgname=Xplist
pkgver=1.2.47
pkgrel=8
pkgdesc="Cross-platform Plist Editor.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/ic005k/Xplist"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    'libglvnd'
    'libgpg-error'
    'freetype2'
    'libx11'
    'fontconfig'
    'e2fsprogs'
    'libxcb'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Xplist/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9319fd1f4ccda8abe34ab18390f3cd81d69c442c5030f7583e59c8bc4c1395eb'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b'
            '43dd8d6124875ee6f7690e2012a151e2df73a753ebb808d349bf454feb44ccb2')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun/${pkgname%-bin}/g
        s/icon/${pkgname%-bin}/g
        s/Application;/Utility;/g
    " "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}