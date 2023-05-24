# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-music-appimage
pkgver=0.3.3
pkgrel=1
pkgdesc="Light music.轻音乐"
arch=('x86_64')
url="https://simple-music.netlify.app/"
_githuburl="https://github.com/joey2217/simple-music"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-bin")
depends=('zlib' 'glibc')
makedepends=('gendesk' 'yarn' 'npm')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2ab2e85f9d60e4c1ac8d95d2f4d7578fa864b9e602c201036cf344282d2bc74')
build() {
    # For Chinese only
    #yarn config set -g registry http://mirrors.cloud.tencent.com/npm/
    #yarn config set -g sass_binary_site http://mirrors.cloud.tencent.com/npm/node-sass/
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    yarn install
    yarn package -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}/release/SimpleMusic-${pkgver}-linux-${arch}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    gendesk -f --icon "${pkgname%-appimage}" --categories "AudioVideo" --name "SimpleMusic轻音乐" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}