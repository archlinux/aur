# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
_pkgname="CatCatDM React"
pkgver=1.9.5
pkgrel=2
pkgdesc="catcat弹幕姬.哔哩哔哩直播弹幕姬： 查看直播间弹幕。"
arch=('x86_64')
url="https://github.com/kokolokksk/catcat-dm-react"
license=('MIT')
conflicts=("${pkgname}")
depends=('libxext' 'dbus' 'gtk3' 'mesa' 'alsa-lib' 'cairo' 'gcc-libs' 'libxcb' 'libx11' 'libdrm' 'libxdamage' 'at-spi2-core' 'nspr' \
    'nss' 'hicolor-icon-theme' 'libxrandr' 'expat' 'libcups' 'pango' 'libxcomposite' 'glib2' 'libxkbcommon' 'libxfixes' 'glibc')
makedepends=('npm>=7' 'nodejs>=18' 'gendesk' 'yarn')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('a875f47e273cd4c9ae915a3c7c29f5ca58aab38505fcbde5cd620a856b22097d')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp "${srcdir}/${pkgname}-${pkgver}/assets/icon.min.svg" "${srcdir}/${pkgname}-${pkgver}/assets/icon.svg"
    sed "s|-p always|-p never|g" -i package.json
    yarn
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r  "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}