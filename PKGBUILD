# Maintainer: Dominic Harris <dominic@domm.me>

pkgname=catfetch-git
pkgver=0.0.5r25.b65cb4b
pkgrel=1
pkgdesc='A small and cute fetch program written in Go'
arch=('x86_64')
url="https://github.com/Domterion/catfetch"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}-${pkgver}"

	printf "0.0.5r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}   

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o build -ldflags "-linkmode=external -X main.version=${pkgver}" ./cmd/...
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 build/catfetch "${pkgdir}"/usr/bin/catfetch
}
