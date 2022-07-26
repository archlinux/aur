# Maintainer: Santiago Lo Coco <santilococo.01 at gmail dot com>

_pkgname=hakrawler
pkgname="${_pkgname}-git"
pkgver=r216.6190559
pkgrel=1
pkgdesc='Simple, fast web crawler designed for easy, quick discovery of endpoints and assets within a web application.'
arch=('x86_64')
url="https://github.com/hakluke/${_pkgname}"
license=('GPL3')
makedepends=('go' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 build/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
