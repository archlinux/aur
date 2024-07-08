# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediago-bin
_pkgname=MediaGo
pkgver=2.2.3
_electronversion=30
pkgrel=1
pkgdesc="视频在线提取工具 流媒体下载 m3u8下载"
arch=('x86_64')
url="https://downloader.caorushizi.cn/"
_ghurl="https://github.com/caorushizi/mediago"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-setup-amd64-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/caorushizi/mediago/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5120c637b9bd3721970d6fab52f82b7e2c0c844dad23cccb54b121e2ee43190e'
            '029419e98f7e94359d2b8e96db62d1482242d51af55bc5c5b5ac3e2448edb4ee'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    unlink "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/node-pty/build/node_gyp_bins/python3"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"{app.asar.unpacked,bin,plugin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    ln -sf "/usr/bin/python" "${pkgdir}/usr/lib/mediago/app.asar.unpacked/node_modules/node-pty/build/node_gyp_bins/python3"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}