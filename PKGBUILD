# Maintainer: Patrick Mang <aur at patrickmang dot de>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=tidal-hifi
pkgver=6.3.1
pkgrel=1
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine"
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3 alsa-lib)
makedepends=(nodejs npm libxcrypt-compat python)
source=("${pkgname}-${pkgver}-Mavy.tar.gz::https://github.com/Mastermindzh/tidal-hifi/archive/refs/tags/${pkgver}-Mavy.tar.gz"
        "tidal-hifi.desktop")
sha256sums=('4d8ce96576f6fc71edb4621ab233f85c1f2b8b5a947c2fe8ec6e2c539a61f336'
            '7e3b485443be639c8c13964b94ce20e7df3ba54463c3f0dcf5883a29297d21e3')

build() {
    cd "tidal-hifi-${pkgver}-Mavy"

    npm install
    npm run build-unpacked
}

package() {
    cd "tidal-hifi-${pkgver}-Mavy"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
