# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=primate-bin
_pkgname=Primate
pkgver=1.0.0
pkgrel=3
pkgdesc="A modern dashboard for Kong Gateway admins"
arch=('x86_64')
url="https://www.getprimate.xyz/"
_githuburl="https://github.com/getprimate/primate"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'libxrandr' 'libxkbcommon' 'cairo' 'gcc-libs' 'dbus' 'libxcomposite' 'nspr' 'nss' 'pango' 'libx11' \
    'expat' 'glibc' 'at-spi2-core' 'gtk3' 'libdrm' 'libxcb' 'libxfixes' 'glib2' 'libxext' 'alsa-lib' 'mesa' 'libxdamage' 'libcups')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/getprimate/primate/v${pkgver}/LICENSE")
sha256sums=('5f6c2ecf1964210baf6b1ea24d6bb0ef17686bf375af9d1d86c392c008c0fc3a'
            'dd4c137b56da1d126c2aa91b11250f4b1c2973f4dec7f44ce904359bbb1d5612')
prepare() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/icons//${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}