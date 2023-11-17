# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=clash.rev
pkgname=${_pkgname}-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Continuation of Clash core project"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/MerlinKodo/clash-rev'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
makedepends=('git' 'go' 'cmake' 'zip')
provides=(${_pkgname} 'clash')
conflicts=(${_pkgname} ${_pkgname}-git 'clash')
source=(
    "git+https://github.com/MerlinKodo/clash-rev.git"
    "clash.service"
)
sha256sums=(
    "SKIP"
    "9847a046071f4c1b92e71c3cb3b214cf5d19c4dd25ad8326e70c58c55b1e9deb"
)


pkgver() {
    cd "$srcdir/clash-rev"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

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
    cd "${srcdir}/clash-rev"
    make -j $(go run ./test/main.go) ${_pkg}
    mv bin/clash.rev-${_pkg} "${srcdir}/${_pkgname}-${CARCH}-${pkgver}"
}

package() {
    cd "${srcdir}"
    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}