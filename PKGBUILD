# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=taratormusic-bin
_pkgname=TaratorMusic
pkgver=1.5.6
_electronversion=31
pkgrel=1
pkgdesc="A music player application with playlist support and Discord integration.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Victiniiiii/TaratorMusic"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
    'python'
)
makedepends=(
    'fuse2'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e8dc77524e7e68a36924dd5ff3763f605972208fb602c63e0f79e703ad3f918'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources/" -type d -exec chmod 755 {} +
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/squashfs-root/resources/app/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${srcdir}/squashfs-root/resources/app/node_modules/ffprobe-static/bin/linux/x64/ffprobe"
    ln -sf "/usr/bin/python3" "${srcdir}/squashfs-root/resources/app/node_modules/better-sqlite3/build/node_gyp_bins/python3"
    ln -sf "/usr/bin/python3" "${srcdir}/squashfs-root/resources/app/node_modules/register-scheme/build/node_gyp_bins/python3"
    rm -rf \
        "${srcdir}/squashfs-root/resources/app/node_modules/ffprobe-static/bin/"{darwin,linux/ia32} \
        "${srcdir}/squashfs-root/resources/ffmpeg.exe" \
        "${srcdir}/squashfs-root/resources/app/extra-resources/ffprobe.exe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}