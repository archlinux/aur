# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname=igdm-bin
_pkgname=IGdm
pkgver=3.0.4
pkgrel=5
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64')
url="https://github.com/igdmapps/igdm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'nss'
    'gtk3'
    'alsa-lib'
    'libxrender'
    'libxcomposite'
    'libcups'
    'libxdamage'
    'nspr'
    'libxcursor'
    'gdk-pixbuf2'
    'libxext'
    'libx11'
    'libxfixes'
    'hicolor-icon-theme'
    'cairo'
    'pango'
    'dbus'
    'libxtst'
    'libxcb'
    'mesa'
    'expat'
    'libxrandr'
    'libxi'
    'libdrm'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/igdmapps/igdm/v${pkgver}/LICENSE"
)
sha256sums=('c65181d96bc3886b77e37fe76d4a17626399ed3253a6353b78759fe0a1e40d99'
            'cfe59b21a32217b32573315adbcc0f3621aeaa8dec634e54eb30a0cf260867cc')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp "${srcdir}/app.asar.unpacked/dev-app-update.yml" "${srcdir}/opt/${_pkgname}/resources/app-update.yml"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}