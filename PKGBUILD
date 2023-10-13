# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-s3-file-manager
pkgver=0.2.0
pkgrel=2
pkgdesc="A GUI AWS S3 file manager. It supports keyword search, download, upload and preview video."
arch=('any')
url="https://github.com/kelp404/electron-s3-file-manager"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'make' 'python' 'alsa-lib' 'libdrm' 'pango' 'nss' 'gtk3' 'libxfixes' 'libxdamage' 'gcc-libs' 'glib2' 'cairo' 'nspr' \
    'libxcomposite' 'libcups' 'dbus' 'libx11' 'glibc' 'at-spi2-core' 'libxrandr' 'libxkbcommon' 'expat' 'mesa' 'libxext' 'libxcb' 'wayland')
makedepends=('gendesk' 'npm' 'nodejs>=18')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('482233095b915bcca18e7b1729a3f9145e76c378d2099110585e3c7cccec156d')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e '/dmg/d' -e "s|win|linux|g" -e "s|portable|AppImage|g" -i tools.js
    npm install
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}