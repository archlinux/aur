# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=emsmediasystem-bin
_pkgname=EMS.Media.System
pkgver=6.1.3
_electronversion=37
pkgrel=1
pkgdesc="An Electron-based media presentation tool that provides a dual-window approach to media playback,allows users to control media presentation from a management window.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/clockley/EjaxMediaSystem"
license=('LGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'perl'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('5057e2bbf55e7919ac6c7f4251734d045b4df42044d58bdca9752d7e1b12c064'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Audio;/AudioVideo;/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
    rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@julusian/freetype2/prebuilds/"{*-darwin-*,*-win32-*}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@julusian/freetype2/prebuilds/"{freetype2-linux-arm,*-x64-*}
            ;;
        x86_64)
            rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@julusian/freetype2/prebuilds/freetype2-linux-arm"*
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}