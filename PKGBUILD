# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-bin
_pkgname=Ghost-Downloader
pkgver=3.5.9
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide (Prebuilt version) 多线程下载器 协程下载器."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/XiaoYouChR/Ghost-Downloader-3"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'xcb-util-cursor'
    'xcb-util-renderutil'
    'xcb-util-keysyms'
    'xcb-util-wm'
    'xcb-util-image'
    'gtk3'
    'libpulse'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/XiaoYouChR/Ghost-Downloader-3/v${pkgver}/resources/logo.png"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-x86_64.zip")
sha256sums=('f98dd87dd1e00000397e3121276be851bf3dd435c844d68c709bdceab2e7ccaa'
            'f003b130010311751a619cae8188af15f003369d71c59f7b34bbc26c98e615d5')
sha256sums_aarch64=('651968ae9aa0479b8d1d9bd01c5a8fcb5713a92abef426146b4f18f12eae1ae7')
sha256sums_x86_64=('6611830118a98adf62a91b1148275a148ddc2bf949a1939999107183205176ca')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}-3.bin"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    touch "${pkgdir}/usr/lib/${pkgname%-bin}/"{"${_pkgname//-/ } 记录文件","${_pkgname//-/ } 运行日志.log","${_pkgname//-/ } 配置文件.json"}
    chmod 666 "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname//-/ }"*
}