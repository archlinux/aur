# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=gh-dash
pkgver=4.12.0
pkgrel=1
pkgdesc="A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about"
arch=("i686" "x86_64" "armv6h" "aarch64")
license=("MIT")
url="https://github.com/dlvhdr/gh-dash"
makedepends=("go")
optdepends=("ttf-font-nerd: icons support")
depends=("glibc" "github-cli>=2.0.0")
options=("strip" "buildflags")
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b039d52d3fb8075c4c002d791c12e35dcdf6bc0fb1bce7d62f84a8eecb16bcd3')
    
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
    install -Dm655 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
