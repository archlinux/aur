# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gui-butler
pkgver=2.3.1
pkgrel=1
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project."
arch=('any')
url="https://seansleblanc.itch.io/gui-butler"
_githuburl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname}")
depends=('glibc' 'expat' 'cairo' 'alsa-lib' 'libxdamage' 'gtk3' 'libxext' 'glib2' 'nspr' 'libxcb' 'libdrm' 'nss' 'libxfixes' \
    'bash' 'at-spi2-core' 'gcc-libs' 'libxcomposite' 'dbus' 'libxrandr' 'pango' 'libx11' 'libxkbcommon' 'libcups' 'mesa')
makedepends=('npm' 'gendesk' 'electron25')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('22364d6b0ee54059e28cd7b12d863b3b6e3b1f71a1d672d9d9dce7442bd2bb3d')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install 
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/bin/"${pkgname}-linux-*/* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/resources/app/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Development;Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}