# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revealed-bin
_pkgname=Revealed
_appname="@${pkgname%-bin}desktop"
pkgver=2.0.0_alpha.15
_electronversion=23
pkgrel=6
pkgdesc="A platform and store for apps, games, and more!"
arch=('x86_64')
url="https://www.appsrevealed.com/"
_ghurl="https://github.com/BunnyStrike/revealed"
license=('LicenseRef-GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'python'
    'gtk3'
    'alsa-lib'
    'libxext'
    'nspr'
    'nss'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}.pacman"
)
sha256sums=('64053a54fae6f9f4d40cb156ebf3dc5cf8fca6d8aaa1fff0e941d572048457f8')
build() {
    sed "s|\"/opt/${_pkgname}/${_appname}\" %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}