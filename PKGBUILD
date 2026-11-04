# Maintainer: agony <27015 at riseup dot net>

pkgname=neo4j-mcp
pkgver=2.1.0
pkgrel=1
pkgdesc='Neo4j official MCP server'
arch=('x86_64' 'aarch64')
url='https://github.com/neo4j/mcp'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
install=neo4j-mcp.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('046289f55e09265b1afcc6d412cba5da580674bf919ce0f1ee957c1c3275fcd3')

prepare() {
  cd "mcp-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "mcp-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.Version=v${pkgver}" -o neo4j-mcp ./cmd/neo4j-mcp
}

check() {
  cd "mcp-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "mcp-${pkgver}"
  install -Dm755 neo4j-mcp -t "${pkgdir}/usr/bin"
}
