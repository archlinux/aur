# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="datefile-bin"
_appname="DateFile"
pkgver=0.1.0
pkgrel=1
pkgdesc="Index files in a directory using the date of another file as a filter"
arch=('x86_64')
url="https://github.com/kna40/DateFile"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glibc' 'libxext' 'nss' 'libxfixes' 'gtk3' 'libcups' 'dbus' 'libxcomposite' 'libx11' 'libxdamage' 'expat' 'libxkbcommon' \
    'cairo' 'pango' 'libxrandr' 'glib2' 'libdrm' 'mesa' 'nspr' 'libxcb' 'at-spi2-core' 'alsa-lib' 'gcc-libs')
makedepends=('npm' 'gendesk')
options=()
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b6fe8fbfd9531233f43123cb962544725daf5a3055070ea32e4d7b923d560d3')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    sed "15s|--out=./.bin|--out=./out|g" -i package.json
    npm install && npm run build-linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/"*  "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/assets/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}