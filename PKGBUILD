# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
_pkgname=VNote
pkgver=3.20.0
pkgrel=1
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now.(Prebuilt version)"
arch=('x86_64')
url="https://app.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'libdrm'
    'freetype2'
    'fribidi'
    'alsa-lib'
    'libx11'
    'qt6-declarative'
    'libxcb'
    'qt6-webengine'
    'qt6-svg'
    'qt6-5compat'
    'qt6-webchannel'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
    '!staticlibs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('e81502e966b5f12a82bf59a60b56a7a9c123b10cce89d733689e0b55e4b8c939'
            '7feea40a0bd1a6668b2acf9adccf1678fb1f0c00f02fd688699cc51e92ca95da')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    rm -rf "${srcdir}/squashfs-root"
    if [ ! -x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" ];then
        chmod +x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
