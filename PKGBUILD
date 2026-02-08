# Maintainer: Patrick Mang <aur at patrickmang dot de>
# Contributor: Ain Ruiz Dorado <maxain201 at gmail dot com>

pkgname=tidal-hifi-tidaluna
pkgver=6.1.0
_tidalunaver=1.10.0-beta
pkgrel=5
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine (with TidaLuna client mod)."
conflicts=("tidal-hifi")
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(nodejs npm libxcrypt-compat python unzip git)
source=("tidal-hifi-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/archive/refs/tags/${pkgver}.tar.gz"
        "luna-${_tidalunaver}.zip::https://github.com/Inrixia/TidaLuna/releases/download/${_tidalunaver}/luna.zip"
        "tidal-hifi-tidaluna.desktop")
noextract=("luna-${_tidalunaver}.zip")
sha256sums=('21eaf5d3d15f2af43f024ee24467c60b761585eb7c5c002d7c43634f494247dc'
            '27b6cb8379d30d490044a4c2ab51755efbf880e03723852889ea7e525e4f2b8f'
            '8fe1352dae97c301bf63be9419e56c9775683e124b0218e118f020588d95565b')

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

    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm644 "${srcdir}/tidal-hifi-tidaluna.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
