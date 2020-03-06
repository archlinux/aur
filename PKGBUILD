# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=stegify
pkgname=${_pkgname}-git
pkgver=1.2.r1.gde74f17
pkgrel=1
pkgdesc="Tool for LSB steganography written in Go"
arch=(x86_64)
url="https://github.com/DimitarPetrov/stegify"
license=("custom:MIT")
depends=("glibc")
makedepends=("git" "go-pie" "golang-golang-x-tools")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/DimitarPetrov/stegify.git")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

prepare() {
    cd "$_pkgname"

    go get -v -t -d ./...
}

build() {
    cd "$_pkgname"

    go build \
        -trimpath \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-s -w -extldflags ${LDFLAGS}" \
        .
}

package() {
    cd "$_pkgname"

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
