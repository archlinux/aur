# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=any-sync-gui
_appname="Lan同步"
pkgver=1.2.0
pkgrel=1
pkgdesc="一款支持在pc与pc或移动设备之间同步文本信息或文件的应用"
arch=('any')
url="https://github.com/easyhutu/any-sync-gui"
license=('custom')
conflicts=("${pkgname}")
depends=('libxcomposite' 'libxkbcommon' 'libxfixes' 'libcups' 'mesa' 'alsa-lib' 'expat' 'cairo' 'libxrandr' 'pango' 'glibc' \
    'libxext' 'libxcb' 'at-spi2-core' 'libdrm' 'nspr' 'libxdamage' 'glib2' 'gcc-libs' 'nss' 'dbus' 'libx11' 'gtk3')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3248c7e1f71fae0d1d8985d8be4f6428c4b4ba3d4e9cf2f0f98f32262e7e869b')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/fe"
    npm install
    npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron_gui"
    npm install 
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r  "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${_appname}-"* "${pkgdir}/opt"
    mv "${pkgdir}/opt/${_appname}"* "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${pkgdir}/opt/${pkgname}/${_appname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}-${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname}"
}