# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catalystplus-desktop-bin
_pkgname=CatalystPlus
pkgver=3.8.2
_electronversion=22
pkgrel=2
pkgdesc="A multi-terminal and interoperable scientific research professional information aggregation platform client to improve the efficiency of researchers' access to the latest research results in the field.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.researchercosmos.com/"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'xpdf'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://assets.catalystplus.cn/CatalystPlusDesktopPackage/linux/%E5%82%AC%E5%8C%96%E5%89%82%E5%8A%A0%20${_pkgname}-${pkgver}.AppImage"
    "LICENSE.html::https://www.researchercosmos.com/docs/terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('23d70f8d388abd9ab24b8ebd90a8dacfbb94d29d3addb791842945a390ee262d'
            'b56c7e5caa0e331d5fa168c2455c8105bb67f69b6ee4808fd9faac85f49430fd'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
    ln -sf "/usr/bin/xpdf" "${srcdir}/squashfs-root/resources/app.asar.unpacked/resources/xpdf.exe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}