# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tomatox-bin
_pkgname=TOMATOX
pkgver=2.0.2
_electronversion=4
pkgrel=8
pkgdesc="A free online VIP video analysis player based on Electron and React, full resources for American dramas, Korean dramas, and Japanese dramas.(Prebuilt version.Use system-wide electron)基于Electron、React开发的全网在线免费VIP视频解析播放器,美剧、韩剧、日剧全资源"
arch=('x86_64')
url="https://github.com/yanjiaxuan/TOMATOX"
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/yanjiaxuan/TOMATOX/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('294ae9a684fe1d8930d852b185dc2d6a6bbc529d5cab14c774228fa881b6e303'
            '457f427d3d4e78f789b6951120b438fd08cbed02372b078cb2346677f5e27029'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun/${pkgname%-bin}/g
        s/Development/AudioVideo/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}