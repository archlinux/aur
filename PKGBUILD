# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spotbar
_pkgname=Spotbar
pkgver=1.0.0
pkgrel=2
pkgdesc="Small applications that provides Spotify media controls in a window that runs in your macOS/Windows/Linux menu bar"
arch=('any')
url="https://github.com/levarr/Spotbar"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('1172869217e0ddf9a0fd4fbef600072dc9adaa35469bbb77124db9b3b6c20d73'
            'd3f529315b3a67b3890ef3677b4392b97dc889c02a3b56e928c9ede7ab2dd81a')
prepare() {
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -e '/- snap/d' -e '/- deb/d' -i electron-builder.yml
    npm install --force
    npm run build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}