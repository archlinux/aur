# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=clasht
pkgver=1.20.0
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions. Convenient for you to witness the larger network world"
arch=("x86_64")
url='https://github.com/DryPeng/clashT'
license=('GPL3')
depends=()
optdepends=('clash-geoip: A GeoLite2 data created by MaxMind')
makedepends=('git' 'go' 'cmake' 'zip')
provides=('clash')
conflicts=('clasht-bin' 'clash' 'clasht-git')
options=(!strip)
source=(
    "https://github.com/DryPeng/clashT/archive/refs/tags/v${pkgver}.zip"
    "clash.service"
)
sha256sums=(
    "24a65aceeb60e19a5191d47e0495ea853964680f93fcfd01c6dc8c184f2e0fec"
    "2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a"
)

build() {
    cd "${srcdir}/clashT-${pkgver}"
    git init
    make -j $(go run ./test/main.go) linux-amd64
    mv bin/clashT-linux-amd64 "${srcdir}/${pkgname}-${CARCH}-${pkgver}"
}

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
}