# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gui-butler-bin"
pkgver=2.3.1
pkgrel=1
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project."
arch=('x86_64')
url="https://seansleblanc.itch.io/gui-butler"
_githuburl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glibc' 'nodejs' 'expat' 'cairo' 'alsa-lib' 'libxdamage' 'gtk3' 'libxext' 'glib2' 'nspr' 'libxcb' 'libdrm' 'nss' 'libxfixes' \
    'bash' 'at-spi2-core' 'gcc-libs' 'libxcomposite' 'dbus' 'libxrandr' 'pango' 'libx11' 'libxkbcommon' 'libcups' 'mesa')
makedepends=('pnpm' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('22364d6b0ee54059e28cd7b12d863b3b6e3b1f71a1d672d9d9dce7442bd2bb3d')
build() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    #For Chinese only
    #npm config set node-linker hoisted
    #npm config set registry=https://registry.npmmirror.com
    #npm config set disturl=https://registry.npmmirror.com/-/binary/node
    #npm config set electron_mirror=https://registry.npmmirror.com/-/binary/electron/
   pnpm install && pnpm run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/bin/${pkgname%-bin}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development;Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}