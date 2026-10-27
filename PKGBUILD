# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-toolbox
pkgver=1.15.0
pkgrel=1
pkgdesc='MCP server for databases'
arch=('x86_64' 'aarch64')
url='https://github.com/googleapis/mcp-toolbox'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b870a9f2be0ea64dd7d2706f22a60c9d0bcce47742cf674ab08702f8dad64e5f')

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
  go build -v -ldflags='-linkmode=external -X github.com/googleapis/mcp-toolbox/cmd.buildType=binary' -o mcp-toolbox .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 mcp-toolbox -t "${pkgdir}/usr/bin"
}
