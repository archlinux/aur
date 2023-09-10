# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
pkgver=2.0.0
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=('any')
url="https://github.com/1111mp/nvm-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('nss' 'cairo' 'gcc-libs' 'libxcb' 'libxrandr' 'gtk3' 'dbus' 'expat' 'libdrm' 'mesa' 'libxcomposite' 'pango' 'at-spi2-core' 'libxext' \
    'libxkbcommon' 'nspr' 'alsa-lib' 'hicolor-icon-theme' 'glibc' 'libcups' 'libxdamage' 'libxfixes' 'libx11' 'glib2')
makedepends=('gendesk' 'npm>=7' 'nodejs>=14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da72613ebf4ed06aa137182474172960956b12a40e606bb6376b80d0c69eb80a')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    gendesk -f -n --icon "${pkgname}" --categories "Development;Utility" --name "nvm-desktop" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}