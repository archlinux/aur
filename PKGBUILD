# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=any-sync-gui
_appname="Lan同步"
pkgver=1.3.0
pkgrel=2
pkgdesc="一款支持在pc与pc或移动设备之间同步文本信息或文件的应用"
arch=('any')
url="https://github.com/easyhutu/any-sync-gui"
license=('custom')
conflicts=("${pkgname}")
depends=('libxcomposite' 'libxkbcommon' 'libxfixes' 'libcups' 'mesa' 'alsa-lib' 'expat' 'cairo' 'libxrandr' 'pango' 'glibc' \
    'libxext' 'libxcb' 'at-spi2-core' 'libdrm' 'nspr' 'libxdamage' 'glib2' 'gcc-libs' 'nss' 'dbus' 'libx11' 'gtk3')
makedepends=('npm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6194fd66558225c5f069db71013f4552d65d9152d482166d3c9ae87adbc79ee')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}-${_appname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/fe"
    npm install --force
    npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron_gui"
    sed '24,27d' -i forge.config.js
    npm install --force
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r  "${srcdir}/${pkgname}-${pkgver}/electron_gui/out/${_appname}-"*/* "${pkgdir}/opt/${pkgname}"
    mv "${pkgdir}/opt/${pkgname}/${_appname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron_gui/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644  "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}