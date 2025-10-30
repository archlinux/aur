# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=gh-dash
pkgver=4.19.0
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
sha256sums=('47e0e783293b8eab9f29f46e35d9aeec2fdcb96e9a6fb3ee3068a1a730b6a62e')
    
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
