# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxygen-desktop
pkgver=0.0.9
pkgrel=1
pkgdesc="The desktop application for Oxygen, which is an AI assistant that helps you analyze investment opportunities."
arch=('any')
url="https://github.com/virattt/oxygen-desktop"
license=('ISC')
conflicts=("${pkgname}")
depends=('at-spi2-core' 'libxext' 'nspr' 'nss' 'dbus' 'libx11' 'glib2' 'gtk3' 'libxfixes' 'expat' 'libxcb' 'mesa' 'glibc' \
    'libxkbcommon' 'cairo' 'libdrm' 'libxrandr' 'alsa-lib' 'libxcomposite' 'gcc-libs' 'libxdamage' 'pango' 'libcups' )
makedepends=('asar' 'gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1bb8d92ac17af32c17f5e9ba1e0b4c47ccd3b5f1124ccc06b751c76c188b34b8')
prepare() {
    gendesk -q -f --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '103,105d' -i package.json
    sed '89,101d' -i package.json
    sed '82,88d' -i package.json
    sed '4i\  "provider": "virattt",' -i package.json
    sed '5i\  "repository": "https://github.com/virattt/oxygen-desktop",' -i package.json
    npm install
    npm run build
    asar e "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked"
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/${pkgname}}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/project_${pkgname%-desktop}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}