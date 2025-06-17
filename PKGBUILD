# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=deletor
pkgver=1.5.0
pkgrel=1
pkgdesc="Manage and delete files efficiently with an interactive TUI and scriptable CLI."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/pashkov256/deletor"
makedepends=('go')
options=("strip" "buildflags")
depends=('glibc')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e4a2a2ca3a1fa420c1962c2d8dd1778a3fbd06dc9a468e6d5f76b9d26971bbeb')
    
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
