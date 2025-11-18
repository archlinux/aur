# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opal-player-bin
_pkgname=Opal
pkgver=1.5.1
pkgrel=1
pkgdesc="Plays relaxing music in the background.(Prebuilt version)"
arch=('x86_64')
url="https://codedead.com/"
_ghurl="https://github.com/CodeDead/opal"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'alsa-lib'
    'libxtst'
    'libxrender'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('0122b84069b120d101fae005fd345521680537b6185f84b1384a3527ec8f6e54'
            'a86afff929bb2d4bb886e0619f6743a02d9e9470c8f1643f0e9db2eb7defbf2d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bi}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Utility/AudioVideo/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.appdata.xml" "${pkgdir}/usr/share/icons/metainfo/${pkgname%-bin}.appdata.xml"
}