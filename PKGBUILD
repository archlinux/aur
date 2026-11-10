# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-grafana
pkgver=2.3.0
pkgrel=1
pkgdesc='MCP server for Grafana'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/mcp-grafana'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
install=mcp-grafana.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90857dbd58efe2da1453ebbd56f85d3dab45dd9fc2942a0ea231cd81ad7fa659')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/grafana/mcp-grafana/v2.version=${pkgver}" -o mcp-grafana ./cmd/mcp-grafana
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test -tags unit ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 mcp-grafana -t "${pkgdir}/usr/bin"
}
