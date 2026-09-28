# Maintainer: Yoann ONO <contact@y0no.fr>

pkgname=caido-mcp-server
pkgver=4.3.0
pkgrel=2
pkgdesc="MCP server for interacting with the Caido web proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/c0tton-fluff/caido-mcp-server"
license=('MIT')
makedepends=('go')
optdepends=('caido-desktop: local Caido instance for the MCP server')
options=('!debug')
install=caido-mcp-server.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d02d57cbe865c289b3a7ecbeb0fc7bf59d83cbc0c558787726a8f64a9c76c9fb')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export CGO_ENABLED=0
    export GOFLAGS='-trimpath -mod=readonly -modcacherw'
    go build -buildvcs=false -ldflags "-X github.com/c0tton-fluff/caido-mcp-server/v4/internal/buildinfo.version=v${pkgver}" -o "${pkgname}" ./cmd/caido-mcp-server
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
