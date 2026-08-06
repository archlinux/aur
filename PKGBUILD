# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=andcli
pkgver=2.8.1
pkgrel=1
pkgdesc="A 2FA TUI for your shell"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/tjblackheart/andcli"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('252e026b464825a6886dc7f5e8fac9bda81af7975bb8c623d9f8e682f6745bd5')
    
prepare(){
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}
    
build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "${pkgname}-${pkgver}"
    go build -o "build/${pkgname}" "./cmd/${pkgname}"
}

check() {
    cd "${pkgname}-${pkgver}"
    go test -coverprofile .coverage ./...
    go tool cover -func .coverage
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm655 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
