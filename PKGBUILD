# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.4.5
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('04099335d33b0232332e01381a8363b0bec973b0963554a8cf7dedb9e1541bdb56c7c816a4561c2bb4df80dca5bc8eeb57e4f39b24b46a63ed36ea17b0303d50')

build() {
    cd "${pkgname}-${pkgver//_/-}"
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd "${pkgname}-${pkgver//_/-}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver//_/-}"
    install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
