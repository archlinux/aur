# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=bumper
pkgver=0.3.0
pkgrel=1
pkgdesc='Easily bump $pkgver in your AUR packages.'
url='https://github.com/bcyran/bumper'
provides=('bumper')
conflicts=('bumper-bin')
makedepends=('go')
checkdepends=('go')
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef5903fda682df3909e05edaefe9f8db1299ee8dd8baec9e2de6ae70ab8d5910')

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/completions

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "build/${pkgname}"

    "build/${pkgname}" --completion bash > "build/completions/${pkgname}"
    "build/${pkgname}" --completion zsh > "build/completions/_${pkgname}"
    "build/${pkgname}" --completion fish > "build/completions/${pkgname}.fish"
}

check() {
    cd "${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
