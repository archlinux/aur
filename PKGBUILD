# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-bin
_pkgname=Ghost-Downloader
pkgver=3.5.13
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide (Prebuilt version)多线程下载器,协程下载器"
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
    'qt6-base'
    'libxkbcommon-x11'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/XiaoYouChR/Ghost-Downloader-3/v${pkgver}/resources/logo.png"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.xz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-arm64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-x86_64.tar.xz")
sha256sums=('f98dd87dd1e00000397e3121276be851bf3dd435c844d68c709bdceab2e7ccaa'
            'f003b130010311751a619cae8188af15f003369d71c59f7b34bbc26c98e615d5')
sha256sums_aarch64=('e3c21276e090da5e6c51be20d1b21c4fc0ce235ff5d482f2ba28648f09bbaef9')
sha256sums_x86_64=('5d7dd5b16373e0751130a9fb164a6dccbcbf50f03c80622bf009747bd8d8ab8e')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.xz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
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
