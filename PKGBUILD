# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hype
_pkgname=Hype
pkgver=1.0.14
pkgrel=1
pkgdesc="Find Hype moments from Twitch.tv"
arch=('x86_64')
url="https://hype.lol/"
_githuburl="https://github.com/TimIsOverpowered/Hype"
license=('MIT')
conflicts=("${pkgname}")
depends=('dbus' 'alsa-lib' 'libxfixes' 'glibc' 'libxdamage' 'pango' 'gtk3' 'libcups' 'cairo' 'at-spi2-core' 'glib2' 'expat' 'nspr' \
    'libxext' 'libxcb' 'gcc-libs' 'libxcomposite' 'libdrm' 'libxkbcommon' 'mesa' 'nss' 'libxrandr' 'libx11')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6857b3703ac8bc39a525eb666c6c9892a4f0e59100e04813ab96409ba4df39b5')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "AudioVideo;Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}