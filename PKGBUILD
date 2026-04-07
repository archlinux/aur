# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=deletor
pkgver=2.0.0
pkgrel=1
pkgdesc="Manage and delete files efficiently with an interactive TUI and scriptable CLI."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/pashkov256/deletor"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/"${pkgver}".tar.gz")
sha256sums=('6bd2c548fc85f0e7896bf2324ffd4b31248a6d78a2ae6d7405f3e229c4fb5f81')
    
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
