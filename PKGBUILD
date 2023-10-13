# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hugin-messenger
_pkgname=hugin-desktop
pkgver=0.3.0
pkgrel=2
pkgdesc="The new version of the private messaging desktop application powered by the Kryptokrona Blockchain."
arch=('x86_64')
url="https://hugin.chat/"
_githuburl="https://github.com/kryptokrona/hugin-desktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=('libcups' 'libxfixes' 'at-spi2-core' 'libxrandr' 'alsa-lib' 'libxdamage' 'libxkbcommon' 'gtk3' 'libxcomposite' \
    'expat' 'gcc-libs' 'glib2' 'pango' 'libxcb' 'glibc' 'cairo' 'mesa' 'nss' 'libdrm' 'dbus' 'libxext' 'libx11' 'nspr')
makedepends=('gendesk' 'npm>=8.11.0' 'nodejs>=16.16.0')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('0ece1320b2ebd9eeb609badfd04f673275c9def2a06b9ad3178143ce45ff2819')
prepare() {
    gendesk -f -n -q --categories "Network" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -e '/"deb",/d' -e "s|snap|AppImage|g" -i build.config.json
    npm install --quiet
    chmod a+x node_modules/cross-env/src/bin/cross-env.js
    npm run build:linux-x64
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}