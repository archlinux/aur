# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.7.0
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('6eeb5c1a91e735902cfc4f908106ec13772049ebf00dce136a2b14db4ef9decd9aa4d6bf92053a17ee5a27ca2820942d0e31e23c15743d8c420c9ecb014fc72f')

prepare() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
    mkdir -p build/
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 build/"${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
