# Maintainer: Patrick Mang <aur at patrickmang dot de>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=tidal-hifi
pkgver=5.20.1
pkgrel=2
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(nodejs npm libxcrypt-compat python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/archive/refs/tags/${pkgver}.tar.gz"
        "tidal-hifi.desktop")
sha256sums=('f0d21c54aae1ee5cb85a059abd4bfdca72dbe962796f6ca3e90a4b977d3814f4'
            '7cfd50a00f85a83f6208e2e013d7b254dd769a2a05b35fea2a2b045d86ce475a')

build() {
    cd "tidal-hifi-${pkgver}"

    npm install
    npm run build-unpacked
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
