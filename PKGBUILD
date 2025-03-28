# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=sou
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool for exploring files in container image layers"
arch=("i686" "x86_64" "aarch64")
license=("Apache-2.0")
url="https://github.com/knqyf263/sou"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ddbf687eb45fd880daf5feeec9a663fd988ce22360d77beb045af0192e5d9bee')

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
