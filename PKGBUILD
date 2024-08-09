# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ocat-bin
_appname=OCAT
_pkgname=OCAuxiliaryTools
pkgver=20240001
pkgrel=4
pkgdesc="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager."
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
sha256sums=('648dd19968dbcaaa8c8eeb2fb129f1cc8b1b562b3f3e0b1e6dceb47837f4e627'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b'
            '8fd9eac47233169a5450bf97aee502fb5173512186d900d7ecc1f21b658db225')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g;s|icon|${pkgname%-bin}|g;s|Application;|Utility;|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}