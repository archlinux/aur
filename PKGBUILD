# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rickrack-bin
_pkgname=Rickrack
pkgver=2.9.10
pkgrel=2
pkgdesc="Generate harmonious colors freely.焰火十二卷(实时色彩工具箱)是一款免费且实用的色彩编辑器."
arch=('x86_64')
url="https://eigenmiao.com/rickrack/"
_ghurl="https://github.com/eigenmiao/Rickrack"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'gtk3'
    'alsa-lib'
    'qt5-location'
    'qt5-multimedia'
    'qt5-tools'
    'qt5-serialport'
    'qt5-speech'
    'qt5-quick3d'
    'qt5-remoteobjects'
    'qt5-connectivity'
    'qt5-sensors'
    'qt5-declarative'
    'qt5-x11extras'
    'qt5-xmlpatterns'
    'qt5-wayland'
    'qt5-svg'
    'qt5-base'
    'hicolor-icon-theme'
    'qt5-webchannel'
    'qt5-websockets'
    'qt5-quickcontrols2'
    'qt6-multimedia'
    'qt6-declarative'
    'libpng12'
    'tcl'
    'postgresql-libs'
    'openssl-1.0'
    'tk'
    'libxss'
    'fcitx-qt5'
    'libidn11'
    'unixodbc'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/Rickrack_v${pkgver}_en_linux_x86_64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('928b9562eaff7aaabd18e021de2ca4dd4be8684cda2c9c361aed99e40cf14230'
            'e93be2a7eebb30eaf857bec3a3dce7b9769da12a275d9c13a60f213bfa65f4ba')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/MyColors"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}