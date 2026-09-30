# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=passmcp-agentgateway-extmcp
_repo=passmcp-reporting
pkgver=0.0.4
pkgrel=1
pkgdesc='agentgateway ExtMcp processor that gates MCP backends on offline-verified passmcp attestations'
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/passmcp-reporting/tree/main/integrations/agentgateway-extmcp'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${_repo}-${pkgver}.tar.gz::https://github.com/sebastienrousseau/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34b1ff2024d4f11d5ed43e4d2092930cbc7ddd4a1abfe5a99ccc47c389cdf81c')

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
