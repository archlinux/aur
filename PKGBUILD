# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=Skirk
pkgname=skirk
pkgver=0.1.59
pkgrel=1
pkgdesc="Socks over Google Drive"
arch=("any")
url="https://github.com/ShahabSL/Skirk"
license=("MIT")
makedepends=("git" "go" "make")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('1da55b32aad4faef77220f9e938f241911d9e7d4d0271f85b3b98aec4614466b')

prepare() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    mkdir -p bin
    go build -o bin/${pkgname} \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
              -extldflags \"$LDFLAGS\"" \
    ./cmd/${pkgname}
}

test() {
    cd "${srcdir}/${_pkgname}"
    go test ./...
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
