# Maintainer: devome <evinedeng@hotmail.com>

pkgname="ips"
pkgver=0.3.4
pkgrel=1
pkgdesc="IP geolocation databases tool and library."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/sjzar/${pkgname}"
license=("Apache-2.0")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74ceffc70398fefd5f5e0e083a53fcbbe7a8a9e90c20f2cdf1f7a45e4413523f')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    
    cd "${pkgname}-${pkgver}"
    local ldflags=" \
        -s -w \
        -X github.com/sjzar/${pkgname}/cmd/${pkgname}.Version=v${pkgver} \
        -extldflags '${LDFLAGS}' \
    "
    go build \
        -trimpath \
        -ldflags "${ldflags}" \
        -o "${pkgname}" \
        main.go
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin"                       "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"      *.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
