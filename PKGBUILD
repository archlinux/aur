# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zui-bin
_pkgname=Zui
pkgver=1.4.1
pkgrel=1
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_ghurl="https://github.com/brimdata/zui"
license=("BSD")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'alsa-lib'
    'libxdamage'
    'expat'
    'zlib'
    'cairo'
    'hicolor-icon-theme'
    'at-spi2-core'
    'libxkbcommon'
    'nss'
    'libx11'
    'sqlite'
    'libxrandr'
    'libxcomposite'
    'pango'
    'gtk3'
    'libcups'
    'mesa'
    'libxext'
    'libxcb'
    'libdrm'
    'bash'
    'dbus'
    'nspr'
    'libxfixes'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/brimdata/zui/v${pkgver}/apps/zui/LICENSE.txt"
)
sha256sums=('d6ae3abe1bedf33c0c715cbb27b7ab19abb4b6ae51154e217508f49c38a23b05'
            'e3d24db419fcb44a1dab91f351b8203e74e8501ea11c4be82ad3cc05070cad9f')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}