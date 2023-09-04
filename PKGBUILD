# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dialogcraft
_pkgname=DialogCraft
pkgver=0.9.3
pkgrel=1
pkgdesc="A desktop application built to interact seamlessly with OpenAI's Chat APIs. It provides a user-friendly interface to manage and control your conversations with AI, all from the comfort of your PC, without involving any third-party services."
arch=('any')
url="https://github.com/Hayden2018/dialogcraft"
license=('MIT')
conflicts=("${pkgname}")
depends=('libx11' 'libxcb' 'libxext' 'cairo' 'libdrm' 'expat' 'at-spi2-core' 'mesa' 'nss' 'gtk3' 'nspr' 'libcups' 'libxrandr' 'libxfixes' \
    'libxkbcommon' 'gcc-libs' 'libxcomposite' 'glibc' 'hicolor-icon-theme' 'glib2' 'alsa-lib' 'pango' 'dbus' 'libxdamage')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fcf293f34478a939e059e05ece2107679c18724c1e0fabff2d32862695e78232')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force
    sed '24,27d' -i forge.config.js
    npm run build
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname}"}
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}