# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=tidal-hifi-tidaluna
pkgver=5.20.1
_tidalunaver=1.6.11-beta
pkgrel=1
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine (with TidaLuna client mod)."
conflicts=("tidal-hifi")
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(nodejs npm libxcrypt-compat python unzip)
source=("tidal-hifi-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/archive/refs/tags/${pkgver}.tar.gz"
        "luna-${_tidalunaver}.zip::https://github.com/Inrixia/TidaLuna/releases/download/${_tidalunaver}/luna.zip"
        "tidal-hifi-tidaluna.desktop")
noextract=("luna-${_tidalunaver}.zip")
sha256sums=('f0d21c54aae1ee5cb85a059abd4bfdca72dbe962796f6ca3e90a4b977d3814f4'
            '49b1a65b278939611fa1c27986c54878c058c25c7f569b0cf9a01e2de0c84778'
            '242a9785f9f788739d36b1678d59aacb3722a97f95bf1af7286df9f9a35fb0a0')

build() {
    cd "tidal-hifi-${pkgver}"

    npm install
    npm run build-unpacked

    mv "dist/linux-unpacked/resources/app.asar" "dist/linux-unpacked/resources/original.asar"
    unzip "${srcdir}/luna-${_tidalunaver}.zip" -d "dist/linux-unpacked/resources/app"
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/tidal-hifi-tidaluna.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
