# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=clash.rev
pkgver=Prerelease_dev
pkgrel=1
pkgdesc="Continuation of Clash core project"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/MerlinKodo/clash-rev'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
makedepends=('git' 'go' 'cmake' 'zip')
provides=('clash')
conflicts=(${pkgname}-bin ${pkgname}-git 'clash')
source=(
    "https://github.com/MerlinKodo/clash-rev/archive/refs/tags/v${pkgver}.zip"
    "clash.service"
)
sha256sums=(
    "2ac7927c768870fc19533d074f80de1763dec8db4a9ff0c5476a8a70d2f8af30"
    "9847a046071f4c1b92e71c3cb3b214cf5d19c4dd25ad8326e70c58c55b1e9deb"
)

build() {
    _pkg=linux-amd64
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=linux-arm64
    fi
    if [ "${CARCH}" = "armv7h" ]; then
        _pkg=linux-armv7
    fi
    if [ "${CARCH}" = "i686" ]; then
        _pkg=linux-386
    fi
    cd "${srcdir}/clash-rev-${pkgver}"
    git init
    make -j $(go run ./test/main.go) ${_pkg}
    mv bin/clash.rev-${_pkg} "${srcdir}/${pkgname}-${CARCH}-${pkgver}"
}

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}