# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=proji

pkgname=${_pkgname}
pkgver=0.20.0
pkgrel=1
pkgdesc="A powerful cross-platform CLI project templating tool"
arch=("x86_64")
url="https://github.com/nikoksr/proji"
license=("custom:MIT")
depends=("glibc")
makedepends=("go-pie" "golang-golang-x-sys" "golang-golang-x-text" "golang-github-stretchr-testify" "git")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/nikoksr/proji.git#tag=v${pkgver}")
sha512sums=('SKIP')


prepare() {
    cd "$srcdir/$_pkgname"

    go mod download
    go generate -v ./...
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -v ./
}

check() {
    cd "$srcdir/$_pkgname"

    go vet ./...
    go test -v -coverprofile=coverage.txt -covermode=atomic ./pkg/...
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "proji" "${pkgdir}/usr/bin/proji"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
