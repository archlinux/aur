# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=super-controller
pkgver=1.3.5
pkgrel=1
pkgdesc="Give your MIDI devices super powers: take control of the lights, messages, and communication between controllers."
arch=('any')
url="https://github.com/aolsenjazz/super-controller"
license=('MIT')
conflicts=("${pkgname}")
depends=('lib32-alsa-lib' 'lib32-glibc' 'lib32-gcc-libs' 'python' 'dbus' 'alsa-lib' 'hicolor-icon-theme' 'libxkbcommon' 'libx11' \
    'pango' 'cairo' 'libxext' 'libxcb' 'gcc-libs' 'nss' 'libdrm' 'glib2' 'glibc' 'libxrandr' 'gtk3' 'libxcomposite' 'mesa' \
    'at-spi2-core' 'libxfixes' 'expat' 'libxdamage' 'nspr' 'libcups')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73ea7ef6c4c96b8d15c7bde4185a4cfcb4f4e3b33138b0a6df90ef73c0a91276')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}