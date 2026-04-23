# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-bin
_pkgname=MediaGo
pkgver=3.5.0
_electronversion=41
pkgrel=1
pkgdesc="Video online extraction tool streaming media download, video download,m3u8 download,Bilibili video download.视频在线提取工具,流媒体下载,视频下载,m3u8下载,B站视频下载."
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'bbdown-bin'
    'ffmpeg'
    'aria2'
    'yt-dlp'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-community-setup-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/caorushizi/mediago/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d9f774e75d137c1b76e9a1558f7bebce01e555269933f6c84c1bcd277b68fdf7'
            '029419e98f7e94359d2b8e96db62d1482242d51af55bc5c5b5ac3e2448edb4ee'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}-community/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}-community\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/aria2c" "${srcdir}/opt/${pkgname%-bin}-community/resources/deps/aria2c"
    ln -sf "/usr/bin/BBDown" "${srcdir}/opt/${pkgname%-bin}-community/resources/deps/BBDown"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${pkgname%-bin}-community/resources/deps/ffmpeg"
    ln -sf "/usr/bin/yt-dlp" "${srcdir}/opt/${pkgname%-bin}-community/resources/deps/yt-dlp"
    asar e "${srcdir}/opt/${pkgname%-bin}-community/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${pkgname%-bin}-community/resources/app.asar"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${pkgname%-bin}-community/resources/app.asar"
    find "${srcdir}/opt/${pkgname%-bin}-community" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "${srcdir}/opt/${pkgname%-bin}-community/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
