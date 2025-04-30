# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=y2mp3-bin
pkgver=3.0.1
_electronversion=17
pkgrel=1
pkgdesc="An Electron app to download youtube playlist.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/moshfeu/y2mp3"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com//moshfeu/y2mp3/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c2c75ebe5e1575257b941496624221ac5bc61f0868021229ad3164e74dfbf7a2'
            'e38ba30feb86e7387a43e735f2b65cf072436b3af6b3333abb4e6c460e6622fe'
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
    sed -i -e "
        s/AppRun  --no-sandbox/${pkgname%-bin}/g
        s/Music/AudioVideo/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}