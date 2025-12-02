# Maintainer: Patrick Mang <aur at patrickmang dot de>
# Contributor: Marie Piontek <marie@kaifa.ch>

pkgname=tidal-hifi
pkgver=5.20.1
pkgrel=4
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(nodejs npm libxcrypt-compat python git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/archive/refs/tags/${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/Mastermindzh/tidal-hifi/pull/731.diff"
        "tidal-hifi.desktop")
sha256sums=('f0d21c54aae1ee5cb85a059abd4bfdca72dbe962796f6ca3e90a4b977d3814f4'
            'b898da9e282536417d93efbc703d107f15818a9a0fd1c4ecac843dd226b63e35'
            'e5162e47d42be3b95a943d8f8c0129f2483e097ccdccb59e566d19368537337e')

build() {
    cd "tidal-hifi-${pkgver}"

    # fix: album and title information
    GIT_CEILING_DIRECTORIES="$(dirname "$PWD")" \
        git apply "../731.diff" --exclude "package-lock.json"

    npm install
    npm run build-unpacked
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
