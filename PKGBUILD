# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.5.4
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=('x86_64')
url="https://github.com/rusq/slackdump"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rusq/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('021e348015368dd6fcd9cee880a7eda17973f1c0ead55a31e2f32ce1b1751c00a7d838b5f729ae51d907f13ebb5a969759a8ad0113d1e738822005eadb0b3c1d')

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
}
