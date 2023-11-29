# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jan-bin
_pkgname=Jan
pkgver=0.3.3
pkgrel=1
pkgdesc="Run AI on your own PC"
arch=("x86_64")
url="https://jan.ai/"
_ghurl="https://github.com/janhq/jan"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'at-spi2-core'
    'libxext'
    'libxdamage'
    'mesa'
    'gtk3'
    'libcups'
    'pango'
    'libxkbcommon'
    'nspr'
    'libxcomposite'
    'libx11'
    'libxcb'
    'libxfixes'
    'expat'
    'cairo'
    'hicolor-icon-theme'
    'nss'
    'libxrandr'
    'libdrm'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-${pkgver}.deb"
)
sha256sums=('5ff771b93f6d0ae6bd4728b9a2cd272f7baf999f4ffcac8008e65a192ab3a095')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}