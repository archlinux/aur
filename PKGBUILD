# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=pipeform
pkgver=0.2.1
pkgrel=1
pkgdesc="Terraform runtime terminal user interface"
arch=("i686" "x86_64" "aarch64")
license=("MPL-2.0")
url="https://github.com/magodo/pipeform"
makedepends=("go" "libx11")
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0b251f3d0d259b0e3d15b08b95567f3eef123afae9c3d0e20107cd6f08aa6278')

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
}
