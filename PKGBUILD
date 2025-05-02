# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=roumon
pkgver=1.2.0
pkgrel=1
pkgdesc="Universal goroutine monitor using pprof and termui "
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/becheran/roumon"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e6b63975bd3bc9df06929c07aa894421de849a84f4f6d9df318f37647e90189b')
    
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
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
