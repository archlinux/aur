# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=planes-bin
_pkgname=Planes
_runname="${_pkgname}GraphicsScene"
pkgver=0.4.1.1
pkgrel=5
pkgdesc="Variant of battleships game.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/xxxcucus/planes"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'libxcb'
    'qt6-base'
    'qt6-declarative'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-Multiplayer-${pkgver}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/xxxcucus/planes/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('18876b9db94cbe854f6a39cd8856b067581fd9c6ed0ba533de18dd84d86acf41'
            '1e81694af5e5793ffbe17076d953c0b585cc9a3baf9b7c2d9c21e1297e9caf23'
            '7b0c9c0e0505ec3466ad949fb52f86f52a70845e94fa7e0242835cc7b62bcdac')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_runname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_pkgname}QML/${pkgname%-bin} %U/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}