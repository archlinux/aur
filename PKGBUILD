# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas
_pkgname=Commas
pkgver=0.29.2
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'alsa-lib' 'python' 'dbus' 'gcc-libs' 'cairo' 'glibc' 'libxcb' 'libxkbcommon' 'gtk3' 'libxext' 'libx11' 'libcups' 'libxcomposite' \
    'libxrandr' 'libdrm' 'pango' 'nss' 'expat' 'libxdamage' 'mesa' 'libxfixes' 'nspr' 'at-spi2-core' 'glib2')
makedepends=('gendesk' 'npm>=9' 'nodejs>=18')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('c2614d9d15c30d687f624d7373e0d4cf99dc7bf61c925ad761c061e867ffeae7')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -rf .npmrc
    npm ci
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}