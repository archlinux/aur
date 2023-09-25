# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-desktop
pkgver=0.1.4
pkgrel=1
pkgdesc="An Electron app that provides a native Apple Music experience for Linux & Windows."
arch=('x86_64')
url="https://github.com/Alex313031/apple-music-desktop"
license=('BSD')
conflicts=("${pkgname}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
makedepends=('git' 'gendesk' 'npm' 'nodejs>=16')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('35820e4b4c8743d082b5d651e8cfa013b639681fc37272410d656bd20fb436c3'
            '46d477df193abcfa04a478bf65e28f0d5e62ac525609161ef7658b549cbf883d')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '/zip/d;/deb/d' -i electron-builder.json
    npm install
    npm run build
    npm run distLinux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}