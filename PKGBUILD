# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.10.0
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('768389957a4fbff857d9230f6425c06f801bf02426e0ca2c715643954a8e3e5fa512c974d2c78d7b6227f2accb575557e0821e346395119e2fcd63c2814cb753')

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
