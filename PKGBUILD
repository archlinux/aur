# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.12.3
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('2b267477f4a110442c474fede71220e52eb5cf01cbd69483c0750eb673a64407083653c925310a79f6ab48a73d3370ec7f7d610d4d3756f55298eedf1af4fe23')

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
