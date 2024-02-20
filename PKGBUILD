# Maintainer: Mekyt <hello at mek dot yt>

pkgname='nv'
pkgver=2.2.1
pkgrel=2
pkgdesc='Lightweight utility to load context specific environment variables'
arch=('x86_64')
url='https://github.com/jcouture/nv'
license=('MIT')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jcouture/nv/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('93488c9174420a6d9115f5cb640b9b6c3e680b71d1ded3a240801cb08f47e6ad36ea98ae93602000834e4156d2887203ea80ccd93ae5d1c98d7b9572998fd1b2')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    go mod download && go mod verify
    go build -ldflags="-w -s" -v -x -o nv ./cmd/nv
}

check() {
    cd "${pkgname}-${pkgver}"
    export GO_ENABLED='0'
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go test -v -cover  ./... | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
