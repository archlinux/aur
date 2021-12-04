# Maintainer: Rick van Lieshout <info@rickvanlieshout.com>

pkgname=tidal-hifi
pkgver=2.4.0
pkgrel=2
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(npm)
source=("${pkgname}-${pkgver}.zip::https://github.com/Mastermindzh/tidal-hifi/archive/${pkgver}.zip"
        "tidal-hifi.desktop")
sha512sums=('de91b8d8c71af56c3d8d15f4ddcd32ff62f5b85ded730354774e4835d983264f40dd7eb291365effa45c39ddd945b34d010f64a62f985db6edb299af0452a161'
            'SKIP')

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

    install -Dm644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
}
