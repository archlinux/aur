# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-music-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Light music.轻音乐"
arch=('x86_64')
url="https://simple-music.netlify.app/"
_githuburl="https://github.com/joey2217/simple-music"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glibc' 'gcc-libs' 'expat' 'libxkbcommon' 'libxcb' 'libxext' 'mesa' 'nss' 'libxdamage' 'libcups' 'at-spi2-core' 'pango' \
    'alsa-lib' 'cairo' 'libxcomposite' 'nspr' 'glib2' 'libxrandr' 'gtk3' 'dbus' 'libdrm' 'libxfixes' 'libx11')
makedepends=('gendesk' 'yarn' 'npm')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2ab2e85f9d60e4c1ac8d95d2f4d7578fa864b9e602c201036cf344282d2bc74')
build() {
    # For Chinese only
    #yarn config set -g registry http://mirrors.cloud.tencent.com/npm/
    #yarn config set -g sass_binary_site http://mirrors.cloud.tencent.com/npm/node-sass/
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
    yarn install
    yarn package -l
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/release/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f --icon "${pkgname%-bin}" --categories "AudioVideo" --name "SimpleMusic轻音乐" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}