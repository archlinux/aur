# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-bin
_pkgname=Ghost-Downloader
pkgver=3.7.4
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
    'qt6-base'
    'libxkbcommon-x11'
    'python'
    'pyside6'
    'python-loguru'
    'ffmpeg'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/XiaoYouChR/Ghost-Downloader-3/v${pkgver}/app/assets/logo.png"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.xz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-arm64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-x86_64.tar.xz")
sha256sums=('13382de9d9dbf7ff9bbff8f4476797fafc91f034311632a8eeedd9c9138abdad'
            'b0592310f06c0ad828c080f34159209e8bb04d2228faf8f3461502de0d4d41ff')
sha256sums_aarch64=('5fbbcd8193ba79444953cf355f640b0c97195eebf1d51b4ff54b6b70f0a16926')
sha256sums_x86_64=('f994a500f64a772dc59829ceb5b411c7afc2a263d935cf4c6a4ac8df7326d456')
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
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type d -name "__pycache__" -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
