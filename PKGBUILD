# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.5.0
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('b486b996252ebea53294f94e9551b5b1a45d6fcbe2dcda562ac325ea01505859b0c790cd32ec89c8dbbba6f8c04383489c8e3284d16c07412562efdfe5987469')

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
