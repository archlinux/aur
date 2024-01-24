# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-bin
_pkgname=Knot
pkgver=1.1.38
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'gmp'
    'libgpg-error'
    'libglvnd'
    'libxcb'
    'e2fsprogs'
    'nspr'
    'alsa-lib'
    'sqlite'
    'qt6-declarative'
)
makedepends=(
    'squashfuse'
)
options=(
    '!strip'
    'emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a81a7a9b75f274f02e95aedaa8096284e91f6d0123054b406cadb62efe9b2062'
            'e81172c8f0c194e8fb34edd30b153e60407a094bbf2492abe4e012e6a1ad854a'
            'fe490dfe8c24f2c685b516d2366d86a64f7882b3f488d529b614f71972d85a2d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g" \
        -e "s|icon|${pkgname%-bin}|g" \
        -e "s|Application;|Utility|g" \
        -e "s|Name=${_pkgname}|Name=Android ${_pkgname}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}