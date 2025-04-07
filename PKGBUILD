# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-bin
_pkgname=Knot
pkgver=1.2.25
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/ic005k/Knot"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'alsa-lib'
    'sqlite'
    'qt6-declarative'
    'qt6-webchannel'
    'qt6-webengine'
    'qt6-positioning'
    'libgpg-error'
    'nss'
    'nspr'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('58c9c0f5258268db970b6fa509168cd0c5b621954d9cbdbc70deb1607380207a'
            '5076e0113e6e491d04559dd9ec0a80a35392bec88928393d47b8dd620aa96d66'
            '6f38e0cb252008b84532d5914cb851aa45518771db172e7f5a091fe16123e05e')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/icon/${pkgname%-bin}/g
        s/Application;/Utility;/g
        s/Name=${_pkgname}/Name=Android ${_pkgname}/g
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
