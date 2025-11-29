# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=tidal-hifi-tidaluna
pkgver=5.20.1
_tidalunaver=1.7.2-beta
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
        "https://patch-diff.githubusercontent.com/raw/Mastermindzh/tidal-hifi/pull/731.diff"
        "tidal-hifi-tidaluna.desktop")
noextract=("luna-${_tidalunaver}.zip")
sha256sums=('f0d21c54aae1ee5cb85a059abd4bfdca72dbe962796f6ca3e90a4b977d3814f4'
            '22585bf1211380823727f8e98cedb602ad3ddea7cc9f1a1e939b2db286183499'
            'b898da9e282536417d93efbc703d107f15818a9a0fd1c4ecac843dd226b63e35'
            '8fe1352dae97c301bf63be9419e56c9775683e124b0218e118f020588d95565b')

build() {
    cd "tidal-hifi-${pkgver}"

    # fix: album and title information
    GIT_CEILING_DIRECTORIES="$(dirname "$PWD")" \
        git apply "../731.diff" --exclude "package-lock.json"

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
