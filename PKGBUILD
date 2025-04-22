# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-bin
_pkgname=MediaGo
pkgver=3.0.1
_electronversion=30
pkgrel=2
pkgdesc="Video online extraction tool streaming media download, video download,m3u8 download,Bilibili video download.视频在线提取工具,流媒体下载,视频下载,m3u8下载,B站视频下载."
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-setup-linux-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/caorushizi/mediago/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6f8b2fcb70bac299a4ad02b7c41ca0d6b3f3fef978b229206fdf3fd68e485a67'
            '029419e98f7e94359d2b8e96db62d1482242d51af55bc5c5b5ac3e2448edb4ee'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    unlink "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/node-pty/build/node_gyp_bins/python3"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/"{app.asar.unpacked,bin,plugin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    ln -sf "/usr/bin/python3" "${pkgdir}/usr/lib/mediago/app.asar.unpacked/node_modules/node-pty/build/node_gyp_bins/python3"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}