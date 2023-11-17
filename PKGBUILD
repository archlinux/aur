# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=clasht
pkgname=${_pkgname}-git
pkgver=1.20.0
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions. Convenient for you to witness the larger network world"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/DryPeng/clashT'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
makedepends=('git' 'go' 'cmake' 'zip')
provides=(${_pkgname} 'clash')
conflicts=(${_pkgname} ${_pkgname}-git 'clash')
source=(
    "git+https://github.com/DryPeng/clashT.git"
    "clash.service"
)
sha256sums=(
    "SKIP"
    "2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a"
)


pkgver() {
    cd "$srcdir/clashT"
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
    cd "${srcdir}/clashT"
    make -j $(go run ./test/main.go) ${_pkg}
    mv bin/clashT-${_pkg} "${srcdir}/${_pkgname}-${CARCH}-${pkgver}"
}

package() {
    cd "${srcdir}"
    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}