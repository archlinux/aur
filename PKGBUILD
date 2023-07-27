# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
pkgname=nuclear-player
pkgver=0.6.27
pkgrel=1
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('any')
url="http://nuclear.gumblert.tech/"
_githuburl="https://github.com/nukeop/nuclear"
license=('GPL3')
depends=('python' 'make' 'libcups' 'gdk-pixbuf2' 'libx11' 'gcc-libs' 'libxext' 'glibc' 'bash' 'nspr' 'cairo' 'libxcomposite' 'nss' 'dbus' \
    'at-spi2-core' 'libxrandr' 'expat' 'pango' 'gtk3' 'libdrm' 'libxkbcommon' 'libxshmfence' 'libxfixes' 'mesa' 'alsa-lib' 'libxcb' 'libxdamage' 'glib2')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6fa1b2e8e682fa46712fa2a5850c3323db4851993ff22ddc8627a5664df447cf')
build() {
    cd "${srcdir}/${pkgname%-player}-${pkgver}"
    npm install
    npm run build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname%-player}-${pkgver}/release/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-player}-${pkgver}/packages/app/resources/media/1024x1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "Nuclear Player" --exec "/opt/${pkgname}/${pkgname%-player} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}