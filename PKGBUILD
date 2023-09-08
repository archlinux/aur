# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=polar-bin
_pkgname=Polar
pkgver=2.0.0
pkgrel=4
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing"
arch=("x86_64")
url="https://lightningpolar.com/"
_githuburl="https://github.com/jamaljsr/polar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxdamage' 'glib2' 'alsa-lib' 'libxfixes' 'libxrandr' 'expat' 'gdk-pixbuf2' 'cairo' 'libxshmfence' 'libcups' 'pango' 'glibc' \
    'libxkbcommon' 'nspr' 'libx11' 'mesa' 'libdrm' 'nss' 'libxcomposite' 'libxext' 'gtk3' 'dbus' 'at-spi2-core' 'hicolor-icon-theme' \
    'libxcb' 'gcc-libs' 'docker')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-V${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/jamaljsr/polar/v${pkgver}/LICENSE")
sha256sums=('d35a9a194d9cc77d945a8b6de7e89cf7f12f5e51a2c6b76b8b9d0d38ef477828'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}