# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manyi-transformer
_pkgname=Manyi-transformer
pkgver=1.1.2
pkgrel=1
pkgdesc="A tool for gltf/glb models compression."
arch=('any')
url="https://github.com/MarshallChang/Manyi-transformer"
license=('MIT')
conflicts=("${pkgname}")
depends=('python' 'libvips' 'alsa-lib' 'libdrm' 'mesa' 'hicolor-icon-theme' 'libxfixes' 'libxrandr' 'glibc' 'libxcomposite' \
    'at-spi2-core' 'libx11' 'libxcb' 'libxkbcommon' 'gcc-libs' 'libcups' 'dbus' 'libxdamage' 'nspr' 'pango' 'cairo' 'nss' \
    'gtk3' 'glib2' 'libxext' 'expat')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1a6663949f897bad0b0406470ef33b9df55ee3a2839efedd98f97b8f89de806')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm i
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icons/${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/app/${pkgname}.png"
    done
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "Manyi-transformer" --exec "/opt/${pkgname}/${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}