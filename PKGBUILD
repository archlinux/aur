# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
_pkgname=VNote
pkgver=3.19.1
pkgrel=1
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now.(Prebuilt version)"
arch=('x86_64')
url="https://app.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-webengine'
    'qt6-webchannel'
    'qt6-5compat'
    'alsa-lib'
    'nss'
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
sha256sums=('57be22dc62af4839e07ca07a222a8a712147bab864672337ddc18ef295dd6cf0'
            '649f9f47eb08df7f8fed7362685e3fc43bc6b97751e6c95258b6dbc53dda1830')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" ];then
        chmod +x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage"
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
