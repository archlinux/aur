# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quaternion-bin
_appname="com.github.${pkgname%-bin}"
pkgver=0.0.95.1
pkgrel=6
pkgdesc="A Qt5-based IM client for Matrix.(Prebuilt version)"
arch=('x86_64')
url="https://matrix.org/docs/projects/client/quaternion.html"
_ghurl="https://github.com/quotient-im/Quaternion"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
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
            'af5f3727c731a6b93f61338837afacedbe7308cccd003339498f90ddd3701df6')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin} %U/g" "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 22x22 32x32 48x48 64x64 128x128 scalable)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}