# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.4.1
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('2f82dd83e6ab13e232440743109d2f1a7c3ac02c51af20d85b7f0696ebbdbc150df9a80e8ab802ca406257ded9907dd3d8c4cb5965d105197f569cae5920c064')

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
