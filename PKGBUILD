# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autographa-bin
pkgver=2.4.0
pkgrel=4
pkgdesc="A Bible translation editor for everyone."
arch=("x86_64")
url="https://github.com/friendsofagape/autographa"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pango'
    'libdrm'
    'dbus'
    'libxext'
    'gtk3'
    'nspr'
    'wayland'
    'mesa'
    'hicolor-icon-theme'
    'alsa-lib'
    'libcups'
    'expat'
    'nss'
    'cairo'
    'libx11'
    'libxdamage'
    'libxrandr'
    'libxfixes'
    'libxkbcommon'
    'libxcb'
    'at-spi2-core'
    'libxcomposite'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/friendsofagape/autographa/v${pkgver}/LICENSE"
)
sha256sums=('f069d16802fa9962d76aecf180d754b72e0170c166f944e873cc09ecc3aa89b8'
            '3312af32f10019d4eeca9f021124b04711a870c77e73aea8cec0cba728e1dde8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}-editor/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}-editor/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}