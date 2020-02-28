# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=proji

pkgname=${_pkgname}
pkgver=0.19.0
pkgrel=1
pkgdesc="A powerful cross-platform CLI project templating tool"
arch=("x86_64")
url="https://github.com/nikoksr/proji"
license=("custom:MIT")
depends=("glibc")
makedepends=("go-pie" "golang-golang-x-sys" "golang-golang-x-text" "golang-github-stretchr-testify" "git")
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/nikoksr/proji.git#tag=v${pkgver}")
sha512sums=('SKIP')


prepare() {
    cd "$srcdir/$_pkgname"

    go get -v -t -d ./...
}

build() {
    cd "$srcdir/$_pkgname"

    go build \
        -trimpath \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-s -w -extldflags ${LDFLAGS}" \
        ./cmd/proji
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "proji" "${pkgdir}/usr/bin/proji"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
