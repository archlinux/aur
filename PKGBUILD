# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ohmymd-bin
_pkgname="Oh Mymd"
pkgver=0.6.1
_electronversion=13
pkgrel=4
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_ghurl="https://github.com/1oopstudio/support.ohmymd.app"
license=("LicenseRef-custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'alsa-lib'
    'gtk3'
    'at-spi2-core'
    'make'
    'nspr'
    'nss'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://oss.ohmymd.milchstrabe.com/patch/linux/deb/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('df6cd51ce12fdf9f262eb74d16b9441fb90141dc78a2e89757404fd544046abb')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}