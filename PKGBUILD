# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=stock-git
pkgver=r0
pkgrel=1
pkgdesc='Package/tool/runtime installer — companion to store (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/cushycush/stock'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=('stock' 'stock-bin')
provides=('stock')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o stock ./cmd/stock
}

package() {
    cd "${pkgname}"
    install -Dm755 stock "${pkgdir}/usr/bin/stock"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
