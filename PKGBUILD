pkgname=mcp-language-server
pkgver=0.1.1
pkgrel=2
pkgdesc="Model Context Protocol server that proxies LSP language servers"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/isaacphi/mcp-language-server"
license=('BSD-3-Clause')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/isaacphi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9fd6632a93fe63e14261df82e938174cfb8f106ce58aeb741733bffcafec1217a7f3e973f485a47550976eab393f412a5515572a5be678f535f66e1881d06d42')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export GOCACHE="${srcdir}/gocache"
  export GOBIN="${srcdir}/bin"
  mkdir -p "${GOPATH}" "${GOMODCACHE}" "${GOCACHE}" "${GOBIN}"
  go install -buildmode=pie -trimpath -mod=readonly -ldflags="-s -w" .
  chmod -R u+w "${GOPATH}" "${GOMODCACHE}" "${GOCACHE}"
}

package() {
  install -Dm755 "${srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
