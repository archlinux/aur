# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=zmate
pkgver=0.3.1
pkgrel=1
pkgdesc="Instant terminal sharing using Zellij and SSH."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/ziinaio/zmate"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc' 'zellij' 'openssh')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bc125bc31fd1550a10b5d62c57a083a0f3fe7d6bc7c21975bf268bfe65a338c2')
    
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
    install -Dm655 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm655 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
