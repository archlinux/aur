# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hex-music-player
pkgver=1.0.0
pkgrel=1
pkgdesc="Music client for Plex Media Server"
arch=('any')
url="https://github.com/meisandrew/hex-music-player"
license=('MIT')
conflicts=("${pkgname}")
depends=('libxrandr' 'nss' 'libxdamage' 'alsa-lib' 'expat' 'at-spi2-core' 'mesa' 'pango' 'libcups' 'glib2' 'gcc-libs' 'libxkbcommon' \
    'libxcb' 'gtk3' 'libdrm' 'cairo' 'libxext' 'nspr' 'dbus' 'libxfixes' 'libxcomposite' 'libx11' 'glibc' 'hicolor-icon-theme')
makedepends=('gendesk' 'yarn' 'nodejs>=16')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1c0afb01d935045cd4570ea5611480e44221660e1db0288d4f13a75f40ddbc2')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
    cp "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_1024.png" \
        "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_1024x1024.png"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}