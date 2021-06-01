# Maintainer: Sabu Siyad <ssiyad at disroot dot org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=hopp-cli-git
_pkgname=hopp-cli
pkgver=r81.ae389ad
pkgrel=1
pkgdesc="HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io"
arch=('x86_64')
url="https://github.com/hoppscotch/hopp-cli"
license=("MIT")
makedepends=(
        "git"
        "go")
provides=("hopp-cli")
source=(
    "git+https://github.com/hoppscotch/hopp-cli.git"
)
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${_pkgname}"
    go get -v -u github.com/knadh/stuffbin/...
    go build -o build/${_pkgname} -ldflags="-s -w -X 'main.buildVersion=${pkgver}'" *.go
    stuffbin -a stuff -in build/${_pkgname} -out build/${_pkgname} ./templates/index.html ./templates/template.md:/template.md
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D "build/${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
