# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.1.2
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('03f1559b2f72520947535f3fd1d0571f1ddaff6d0162f5a8eda171dcaae9f01bbc57d9819e929e1a77e33e38352c47bccf183c42a980416e2ce2719a28afa72d')

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd "${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
