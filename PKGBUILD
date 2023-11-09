# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manyi-transformer
_pkgname=Manyi-transformer
pkgver=1.2.0
pkgrel=3
pkgdesc="A tool for gltf/glb models compression."
arch=('any')
url="https://github.com/MarshallChang/Manyi-transformer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'libxdamage'
    'at-spi2-core'
    'dbus'
    'libdrm'
    'pango'
    'libcups'
    'alsa-lib'
    'libxcomposite'
    'libxext'
    'libvips'
    'hicolor-icon-theme'
    'cairo'
    'nspr'
    'python'
    'libxkbcommon'
    'expat'
    'libxcb'
    'nss'
    'libx11'
    'libxfixes'
    'libxrandr'
    'gtk3'
    'mesa'
)
makedepends=(
    'gendesk'
    'npm>=7'
    'nodejs>=14'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('f53b8273fee63a233e9a9895b5480eba382e2cae2f85270d80cbae43b33b04bb')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install --no-package-lock
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/app/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}