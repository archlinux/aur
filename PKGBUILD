# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
pkgver=1.9.5
pkgrel=1
pkgdesc="catcat弹幕姬.哔哩哔哩直播弹幕姬： 查看直播间弹幕。"
arch=('x86_64')
url="https://github.com/kokolokksk/catcat-dm-react"
license=('MIT')
conflicts=("${pkgname}")
depends=('libxext' 'dbus' 'gtk3' 'mesa' 'alsa-lib' 'cairo' 'gcc-libs' 'libxcb' 'libx11' 'libdrm' 'libxdamage' 'at-spi2-core' 'nspr' \
    'nss' 'hicolor-icon-theme' 'libxrandr' 'expat' 'libcups' 'pango' 'libxcomposite' 'glib2' 'libxkbcommon' 'libxfixes' 'glibc')
makedepends=('npm>=7' 'nodejs>=18' 'gendesk' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ff81a4a253c00b38032b84ca510c6483d6674336c636afc2bcdfd5998004e62')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|-p always|-p never|g" -i package.json
    yarn install
    yarn run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r  "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "CatCatDM React" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}