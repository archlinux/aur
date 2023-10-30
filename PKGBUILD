# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'libxdamage'
    'nss'
    'cairo'
    'libxcb'
    'dbus'
    'at-spi2-core'
    'alsa-lib'
    'libx11'
    'libxcomposite'
    'mesa'
    'expat'
    'libxkbcommon'
    'libcups'
    'gtk3'
    'libdrm'
    'nspr'
    'libxrandr'
    'libxfixes'
    'libxext'
    'glib2'
    'pango'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ransome1/sleek/v${pkgver}/LICENSE"
)
sha256sums=('f4abf7e3c3db2fe1d9885fded392adf68182762d3cc66e4f3d21c56d0a151f3d'
            '3ad193e099728945a4483894e75ce62b0867ce735822f8800afd8d71bf32dad6')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin} %U --no-sandbox|g" \
        -e "s|ProjectManagement|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 32x32 48x48 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}