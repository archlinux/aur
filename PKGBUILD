# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=treefmt
pkgver=2.4.0
pkgrel=2
pkgdesc="The formatter multiplexer"
arch=("x86_64")
url="https://github.com/numtide/treefmt"
license=("MIT")
depends=("glibc")
makedepends=("gcc-objc" "go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2b67a03045e8d31c6018d2149438d544c1c9dae7db44510cdd596030a13b38fd')
b2sums=('56a70828e61a2bff39454108e7dc156212d918ad5922a0679d310a58cb50417f898a957a0844f03335a5a64bb76d461125b90c72ca39dce66851afdaefe4762b')

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
