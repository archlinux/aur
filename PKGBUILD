# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=treefmt
pkgver=2.3.1
pkgrel=2
pkgdesc="The formatter multiplexer"
arch=("x86_64")
url="https://github.com/numtide/treefmt"
license=("MIT")
depends=("glibc")
makedepends=("gcc-objc" "go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("02d29561b92110e83596ec93e19c8787b31f4b3211bd0a9d2c384d1b09f74c94")
b2sums=("ac749a60c0c48f234c9c9a32aec82fb8f0103fc4aaf43d09cd91de7f2b2f8833550c39aa0653c02b81c8386831684418c862f0992bfd826ae6d3a9d97d9ee6e5")

prepare() {
    cd "${pkgname}-${pkgver}"

    export GOPATH="${srcdir}"
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -ldflags="-s -w"

    ./treefmt --completion bash > "${pkgname}.bash-completion"
    ./treefmt --completion fish > "${pkgname}.fish"
    ./treefmt --completion zsh > "${pkgname}.zsh"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
