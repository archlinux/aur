# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.2.3
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('b6f672481e78dbd41d00e50b1fd0a3c01424ec712aa0340a9ed654d9f5c4676bfdec9f7e8b6d5975b1d6b394afeed6852b4e29a4b62fe1576a7b3f2eefc8ed59')

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
