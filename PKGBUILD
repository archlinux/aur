# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hugin-messenger
_pkgname=hugin-desktop
pkgver=0.3.0
pkgrel=1
pkgdesc="The new version of the private messaging desktop application powered by the Kryptokrona Blockchain."
arch=('x86_64')
url="https://hugin.chat/"
_githuburl="https://github.com/kryptokrona/hugin-desktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=('libcups' 'libxfixes' 'at-spi2-core' 'libxrandr' 'alsa-lib' 'libxdamage' 'libxkbcommon' 'gtk3' 'libxcomposite' \
    'expat' 'gcc-libs' 'glib2' 'pango' 'libxcb' 'glibc' 'cairo' 'mesa' 'nss' 'libdrm' 'dbus' 'libxext' 'libx11' 'nspr')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2f7b264b85122f1817462c055f8d13f1ef2081bd39dbe39106cb031149143cc')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm ci
    sed '30d' -i build.config.json
    sed "s|snap|AppImage|g" -i build.config.json
    npm run build:linux-x64
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}