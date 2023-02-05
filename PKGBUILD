# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=bumper
pkgver=0.1.0
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
sha256sums=('6eacd5d18e75ac84fbdf7fc0a727ec86bfc408e9df63ca38ad4ac57533408d4c')

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

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "build/completions/${pkgname}" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
