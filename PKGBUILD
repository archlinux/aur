# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=packemon
pkgver=1.5.5
pkgrel=1
pkgdesc="A TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces. "
arch=('i686' 'x86_64' 'aarch64')
license=("BSD-2-Clause")
url="https://github.com/ddddddO/packemon"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
checkdepends=('iproute2')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9dfbf6f62b20153bf66163e9e15caef7c797f1eb22cd4c1f333be842763f270c')
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
    go build -o "build/${pkgname}"
}

check() {
    cd "${pkgname}-${pkgver}"
    echo "Working directory: $PWD"
    echo "$(ls -l)"
    go test
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
