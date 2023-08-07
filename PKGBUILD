# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
pkgver=4.0.a.6
pkgrel=1
pkgdesc="An intuitive cross-platform hardware design application."
arch=('any')
url="https://tomcl.github.io/issie"
_githuburl="https://github.com/tomcl/issie"
license=('GPL3')
conflicts=("${pkgname}")
depends=('expat' 'at-spi2-core' 'nspr' 'gcc-libs' 'pango' 'nss' 'cairo' 'libxkbcommon' 'libxcomposite' 'libcups' 'dbus' \
    'libxfixes' 'libxdamage' 'libx11' 'libxext' 'libdrm' 'mesa' 'libxrandr' 'libxcb' 'alsa-lib' 'glib2' 'gtk3' 'glibc')
makedepends=('nodejs' 'npm' 'dotnet-sdk' 'gendesk')
source=("$pkgname-$pkgver.tar.gz::${_githuburl}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b40b83586f5e76c02fc043ae4a42ed59661d8192a0a76369ed9b38973d5128f3')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dotnet tool restore
    dotnet paket install
    npm update
    npm run dist
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Development" --name "issie" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}