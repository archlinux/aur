# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=utools-bin
_pkgname=uTools
pkgver=4.4.1
pkgrel=1
pkgdesc="uTools Utilities.新一代效率工具平台,自由组合插件应用,打造专属你的趁手工具集"
arch=("x86_64")
url="https://u.tools"
_ghurl="https://github.com/uTools-Labs"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxext'
    'libxcb'
    'libcups'
    'lib32-glibc'
    'pango'
    'libxcomposite'
    'libxrandr'
    'nspr'
    'libx11'
    'libxkbcommon'
    'dbus'
    'mesa'
    'libdrm'
    'libpng'
    'libxfixes'
    'at-spi2-core'
    'gtk3'
    'cairo'
    'expat'
    'libxdamage'
    'hicolor-icon-theme'
    'nss'
    'libxtst'
    'lib32-gcc-libs'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://res.u-tools.cn/version2/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.html::${url}/agreement.html"
)
sha256sums=('24cd6613008cfabffaab1727324ddd772123acf8d89781b0ddc0486a84384e0f'
            '79ece83ed12ba8fe68f7ae40af48df0e3e8f23fcb0f1cae6908fa14221cbab64')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}