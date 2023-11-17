# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
pkgver=4.1.0
pkgrel=2
pkgdesc="An intuitive cross-platform hardware design application."
arch=('any')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'expat'
    'at-spi2-core'
    'nspr'
    'pango'
    'nss'
    'cairo'
    'libxkbcommon'
    'libxcomposite'
    'libcups'
    'libxfixes'
    'libxdamage'
    'libx11'
    'libxext'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxcb'
    'alsa-lib'
    'gtk3'
)
makedepends=(
    'nodejs>=18'
    'npm'
    'dotnet-sdk>=7'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b747eaa4301f4f47c400f78d191c458110d5dfaf3a910429f2600c754bb9c132'
            '81dc5466d488db9e26489a5a00af471dc4529e20509a94b5a030619a471f972f')
build() {
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
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
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}