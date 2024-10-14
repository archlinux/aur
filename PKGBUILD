# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ocat-bin
_appname=OCAT
_pkgname=OCAuxiliaryTools
pkgver=20240004
pkgrel=1
pkgdesc="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager.Prebuilt version."
arch=("x86_64")
url="https://github.com/ic005k/OCAuxiliaryTools"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'java-runtime'
    'libgpg-error'
    'libx11'
    'libxcb'
    'libglvnd'
)
makedepends=(
    'fuse2'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_appname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/OCAuxiliaryTools/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('68fef6628ed4c50fabdb9dd1200e93e7ee63dd956a1eb5306f09e1067980e811'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b'
            'bafc8570aa7f973b5a662e2d2fa23d8d2fd291fa5d3f0265cbfeaf8e2d82ed76')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/icon/${pkgname%-bin}/g
        s/Application;/Utility;/g
    " -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}