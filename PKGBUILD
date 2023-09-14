# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas
_pkgname=Commas
pkgver=0.28.1_alpha.0
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=("x86_64")
url="https://github.com/CyanSalt/commas"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'alsa-lib' 'python' 'dbus' 'gcc-libs' 'cairo' 'glibc' 'libxcb' 'libxkbcommon' 'gtk3' 'libxext' 'libx11' 'libcups' 'libxcomposite' \
    'libxrandr' 'libdrm' 'pango' 'nss' 'expat' 'libxdamage' 'mesa' 'libxfixes' 'nspr' 'at-spi2-core' 'glib2')
makedepends=('gendesk' 'npm>=9' 'nodejs>=18')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('50557b9f40cfa1e137c8641e4b946cc2a8ed21be0f7e50c958e0c3cf5e5bad0b')
prepare() {
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
#    For Chinese Only
#    sed "s|https://registry.npmjs.org|https://registry.npm.taobao.org|g" -i .npmrc
    npm install
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver//_/-}/release/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/resources/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}