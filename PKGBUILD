# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revealed-bin
_pkgname=Revealed
_appname="@${pkgname%-bin}desktop"
pkgver=2.0.0_alpha.15
pkgrel=3
pkgdesc="A platform and store for apps, games, and more!"
arch=('x86_64')
url="https://www.appsrevealed.com/"
_githuburl="https://github.com/BunnyStrike/revealed"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libcups' 'expat' 'libxcb' 'glib2' 'alsa-lib' 'gcc-libs' 'libxdamage' 'nss' 'gtk3' 'nspr' 'libxkbcommon' \
    'libxext' 'at-spi2-core' 'libxrandr' 'libdrm' 'dbus' 'pango' 'mesa' 'glibc' 'hicolor-icon-theme' 'zlib' 'cairo' \
    'libx11' 'libxfixes' 'libxcomposite')
source=("${pkgname%-appimage}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}.pacman")
sha256sums=('64053a54fae6f9f4d40cb156ebf3dc5cf8fca6d8aaa1fff0e941d572048457f8')
prepare() {
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