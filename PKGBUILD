# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=treefmt
pkgver=2.3.1
pkgrel=1
pkgdesc="The formatter multiplexer"
arch=("x86_64")
url="https://github.com/numtide/treefmt"
license=("MIT")
depends=("glibc")
makedepends=("gcc-objc" "go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags="-s -w"

    ./treefmt --completion bash > "${pkgname}.bash-completion"
    ./treefmt --completion fish > "${pkgname}.fish"
    ./treefmt --completion zsh > "${pkgname}.zsh"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 "${pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

}
