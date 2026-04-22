# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=stock
pkgver=0.2.0
pkgrel=1
pkgdesc='Package/tool/runtime installer — companion to store'
arch=('x86_64' 'aarch64')
url='https://github.com/cushycush/stock'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('stock-bin' 'stock-git')
provides=('stock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=v${pkgver}" -o stock ./cmd/stock
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 stock "${pkgdir}/usr/bin/stock"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
