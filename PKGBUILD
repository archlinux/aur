# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=streamdock-bin
_pkgname=StreamDock
pkgver=2.0.0
_electronversion=24
pkgrel=4
pkgdesc="Streaming service viewer."
arch=('x86_64')
url="https://github.com/jtvberg/StreamDock"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'pango'
    'expat'
    'libxkbcommon'
    'libxrandr'
    'alsa-lib'
    'libxdamage'
    'libxext'
    'libdrm'
    'cairo'
    'libx11'
    'libxcomposite'
    'libxfixes'
    'nspr'
    'libcups'
    'gtk3'
    'dbus'
    'nss'
    'libxcb'
    'mesa'
    'at-spi2-core'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jtvberg/StreamDock/v${pkgver}/LICENSE"
)
sha256sums=('03210301d88b67e28ac8788484da5918b86e62bf170348911af342a67223dae4'
            'b6e6ffdf656d1070c5cbaa10491eb4ae4977c8312c7da38d2ed5f118006ce776')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g;s|Video;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}