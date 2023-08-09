# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-music-player
_appname=EMP
_pkgname=emp
pkgver=0.8.8
pkgrel=1
pkgdesc="A functional music player for FLAC, mp3, and m4a audio. "
arch=("any")
url="https://github.com/kevinfrei/EMP"
license=("CC0-1.0")
conflicts=("${pkgname%-bin}")
depends=('libxrandr' 'mesa' 'pango' 'glibc' 'libx11' 'libxext' 'libxdamage' 'cairo' 'gcc-libs' 'gtk3' 'libxfixes' 'at-spi2-core' 'glib2' \
    'libxkbcommon' 'alsa-lib' 'nss' 'libcups' 'hicolor-icon-theme' 'dbus' 'nspr' 'expat' 'libxcb' 'libdrm' 'libxcomposite')
makedepends=('yarn' 'npm' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f720b3a2d18a83b33462201ac545d60d736b62dbeabd1c6273ec6189bb3d6e5e')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    yarn install
    sed '9i\  "repository": "github:kevinfrei/EMP",' -i package.json
    sed "s|\"./\"|\"https://github.com/kevinfrei/EMP\"|g" -i package.json
    yarn run build
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${_appname}-${pkgver}/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "EMP: Electron Music Player" --exec "/opt/${pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}