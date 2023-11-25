# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.11.0
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('89fb263c17f04e448a6771762b7912e96634d9a8fa25381c5ebd0e8f927fe3ebf65ce0238aa71499c4f0baf3da4c90eb6dd04aac21ddedc309ac26bdcd6b72bc')

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
