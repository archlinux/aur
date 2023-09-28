# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
pkgver=4.1.0
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
sha256sums=('b747eaa4301f4f47c400f78d191c458110d5dfaf3a910429f2600c754bb9c132')
prepare() {
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dotnet tool restore
    dotnet paket install
    npm ci
    npm run dist
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}