# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxygen-desktop
pkgver=0.0.7
pkgrel=1
pkgdesc="The desktop application for Oxygen, which is an AI assistant that helps you analyze investment opportunities."
arch=('any')
url="https://github.com/virattt/oxygen-desktop"
license=('custom')
conflicts=("${pkgname}")
depends=('at-spi2-core' 'libxext' 'nspr' 'nss' 'dbus' 'libx11' 'bash' 'glib2' 'make' 'gtk3' 'libxfixes' 'expat' 'glibc' \
    'libxkbcommon' 'cairo' 'libdrm' 'libxrandr' 'alsa-lib' 'python' 'libxcomposite' 'gcc-libs' 'libxdamage' 'pango' 'libcups' 'libxcb' 'mesa')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('621ab2fb7da7f597bfcbad966fa88c930f9293dc8728314b1fe86a243cd9058a')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed '103,105d' -i package.json
    sed '89,101d' -i package.json
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/${pkgname}}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/project_${pkgname%-desktop}" "${pkgdir}/usr/bin/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}