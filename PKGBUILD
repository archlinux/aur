# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tailchat-desktop
pkgver=1.9.0
pkgrel=1
pkgdesc="Next generation noIM application in your own workspace, not only another Slack/Discord/Rocket.chat"
arch=('any')
url="https://tailchat.msgbyte.com/"
_githuburl="https://github.com/msgbyte/tailchat"
license=('Apache')
conflicts=("${pkgname}")
depends=('gdk-pixbuf2' 'nss' 'mesa' 'libxdamage' 'glib2' 'libdrm' 'nspr' 'at-spi2-core' 'glibc' 'cairo' 'expat' 'dbus' 'libxfixes' \
    'libxcomposite' 'libx11' 'pango' 'libcups' 'libxcb' 'alsa-lib' 'libxrandr' 'libxext' 'libxkbcommon' 'gcc-libs' 'gtk3')
makedepends=('gendesk' 'asar' 'npm>=7' 'nodejs>=14' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d626e2c9de1ff243abb8779fa4aaf88ff00d752d27e81cc0f29ecdd999ac839')
prepare() {
    gendesk -f -n --categories "Network" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop"
    yarn install --force
    yarn build
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/client/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-desktop}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}