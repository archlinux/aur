# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=scout-agentgateway-extmcp
_repo=scout-reporting
pkgver=0.0.7
pkgrel=1
pkgdesc='agentgateway ExtMcp processor that gates MCP backends on offline-verified scout attestations'
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/scout-reporting/tree/main/integrations/agentgateway-extmcp'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${_repo}-${pkgver}.tar.gz::https://github.com/sebastienrousseau/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b964f808c0ccf0f8ea8678761d9f066ea24f7ee43be4e0cf0c36b2dedc7f71be')

prepare() {
  cd "${_repo}-${pkgver}/integrations/agentgateway-extmcp"
  export GOPATH="${srcdir}/gopath"
  go mod download -x
}

build() {
  # Built from the whole source tree, so the module builds against the
  # verifier at the same release.
  cd "${_repo}-${pkgver}/integrations/agentgateway-extmcp"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o agentgateway-extmcp -ldflags "-linkmode=external" ./cmd/agentgateway-extmcp
}

package() {
  cd "${_repo}-${pkgver}"
  install -Dm755 integrations/agentgateway-extmcp/agentgateway-extmcp "${pkgdir}/usr/bin/agentgateway-extmcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 integrations/agentgateway-extmcp/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 integrations/agentgateway-extmcp/example/config.json "${pkgdir}/usr/share/doc/${pkgname}/example/config.json"
}
