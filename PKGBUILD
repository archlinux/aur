# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=wakey
pkgver=1.1.0
pkgrel=1
pkgdesc="A TUI built for managing and waking your devices using Wake-on-LAN."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/jonathanruiz/wakey"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29a58792be3334063bf8b2f5b48f9193a5d308b41a7e7f3b2a704d0bb05aa53d')
    
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
    go test
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
