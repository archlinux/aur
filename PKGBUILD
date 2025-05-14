# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=valhalla
pkgname="${_appname}-app-bin"
_pkgname=Valhalla
pkgver=1.1.1_b
_electronversion=18
pkgrel=1
pkgdesc="A productivity app that helps you manage your tasks and projects.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://akrck02.github.io/#/software/valhalla"
_ghurl="https://github.com/akrck02/valhalla"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver//_/}-ubuntu-latest/${_appname}-${pkgver//_/-}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/akrck02/valhalla/${pkgver//_/}-ubuntu-latest/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c5e0ebc37c7508920043b3e099d10b10353e80404b37b91b46479070fef7bfe2'
            '94498661dd39a1b98f9de887a8566146b200bbf7a644b08a5beacbbac927134f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}