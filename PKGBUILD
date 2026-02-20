# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=difi
pkgver=0.1.7
pkgrel=1
pkgdesc='Review and refine Git diffs before you push'
arch=('x86_64')
url='https://github.com/oug-t/difi'
license=('MIT')
makedepends=('go')
depends=('glibc' 'git')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oug-t/difi/archive/v${pkgver}.tar.gz")
sha256sums=('57f70ee446dacc1aedab6e4659528f6ceab894d1499b8e955a5b1b275997cc57')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o difi ./cmd/difi
}

check() {
    cd "${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 difi "${pkgdir}/usr/bin/difi"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
