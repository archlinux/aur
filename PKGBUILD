# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=tidal-hifi
pkgver=2.7.0
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(nodejs-lts-gallium npm)
source=("${pkgname}-${pkgver}.zip::https://github.com/Mastermindzh/tidal-hifi/archive/${pkgver}.zip"
        "tidal-hifi.desktop")
md5sums=('12a11e49911d4204a8df22e022ebd312'
        '234e31f93ccbdeb67f425165efe9e938')

prepare() {
    cd "tidal-hifi-${pkgver}"

    # install build dependencies
    npm install
}

build() {
    cd "tidal-hifi-${pkgver}"

    # We are not using the systems Electron as we need castlab's Electron.
    npm run build-arch
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 build/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
}
