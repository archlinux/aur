# Maintainer: Kemel Zaidan <kemel zaidan at gmail dot com>
pkgname=ssl-checker
pkgver=0.1.7
pkgrel=1
pkgdesc="Fast and beautiful program to check all your https endpoint"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/fabio42/ssl-checker"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a29d9ff77be95acbc4e1100b6e0dce867f5554d9bd3f0ae7bbc4a8c825f07ec8')
    
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
