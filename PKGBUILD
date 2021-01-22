# Maintainer: Sabu Siyad <ssiyad at disroot dot org>

pkgname=hopp-cli
pkgver=0.0.7
pkgrel=1
pkgdesc="HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io"
arch=('x86_64')
url="https://github.com/hoppscotch/hopp-cli"
license=("MIT")
makedepends=("go")
provides=("hopp-cli")
source=(
    "https://github.com/hoppscotch/hopp-cli/archive/v${pkgver}.tar.gz"
)
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go get -v -u github.com/knadh/stuffbin/...
    go build -o build/${pkgname} -ldflags="-s -w -X 'main.buildVersion=${pkgver}'" *.go
    stuffbin -a stuff -in build/${pkgname} -out build/${pkgname} ./templates/index.html ./templates/template.md:/template.md
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D "build/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
