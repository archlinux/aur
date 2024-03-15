# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quaternion-bin
_appname="com.github.${pkgname%-bin}"
pkgver=0.0.95.1
pkgrel=3
pkgdesc="A Qt5-based IM client for Matrix"
arch=('x86_64')
url="https://matrix.org/docs/projects/client/quaternion.html"
_ghurl="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'qt6-declarative'
    'gtk3'
    'alsa-lib'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('43936b9bf37539051e438ef28b111261410ab5ae59d2a2fb84f130a76ef6336b'
            'd40ffcc1141938516e3caa7f731527d7e8beace1782be6ced2820660a7450f25')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} %U|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 scalable;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}