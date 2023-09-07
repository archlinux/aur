# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=solar-wallet-bin
_pkgname=solarwallet
_appname="Solar Wallet"
_debname="io.${_pkgname}.app"
pkgver=0.28.1
pkgrel=2
pkgdesc="Stellar wallet. Secure and user-friendly."
arch=('x86_64')
url="https://solarwallet.io/"
_githuburl="https://github.com/satoshipay/solar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=('glibc' 'gtk3' 'libxcb' 'python' 'libxkbcommon' 'nss' 'libcups' 'dbus' 'nspr' 'libxcomposite' \
    'lib32-gcc-libs' 'libxext' 'expat' 'libxfixes' 'libdrm' 'gcc-libs' 'libxrandr' 'glib2' 'cairo' \
    'sh' 'libxdamage' 'pango' 'mesa' 'lib32-glibc' 'alsa-lib' 'at-spi2-core' 'libx11' 'gdk-pixbuf2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Solar-Wallet-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/satoshipay/solar/v${pkgver}/LICENSE")
sha256sums=('bbf429ba5faf083f602f087970bf6cfddc0178b743432f588d7d2c90764997b3'
            '122419a299dfabb6da3af79d00ffafba42ae185fa757be14cd5140f35c8ce094')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_debname}\" %U|${pkgname%-bin} --no-sandbox %U|g;s|=${_debname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_debname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_debname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}