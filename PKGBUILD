# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=video-hub-app-bin
_pkgname=Video.Hub.App
pkgver=3.2.0
_electronversion=22
pkgrel=8
pkgdesc="The fastest way to browse and search for videos on your computer. Think of it like YouTube for videos on your computer: browse, search, and preview.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://videohubapp.com/"
_ghurl="https://github.com/whyboris/Video-Hub-App"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.3.Demo-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/whyboris/Video-Hub-App/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5264acfd9d4e3ca0ce7332acaeb74431c49b48e9f50f01bd9f45074ea323577b'
            '096d751c3b4fea8ec7f2c8600137020ac6d1ab74b27a6353d1a3dca4271bc9f0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//./ } 3 Demo/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/${pkgname%-bin}-3/${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/node" -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@ffprobe-installer/linux-x64/ffprobe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{assets,app.asar.unpacked,remote} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-3.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}