# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.12.2
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('4a85849c647f8debc6139705211628887c207b2d561325a461206c40f88b6a2d84a27207804e12c25e7eb657db63fdb8815650a7b8c7ebc8ed72bc580f1c9ca6')

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
