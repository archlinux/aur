# Maintainer: agony <27015 at riseup dot net>

pkgname=mcp-toolbox-git
pkgver=r2356.426fb4e
pkgrel=1
pkgdesc='MCP server for databases (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/googleapis/mcp-toolbox'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=('mcp-toolbox')
conflicts=('mcp-toolbox')
source=("mcp-toolbox::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mcp-toolbox
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mcp-toolbox
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd mcp-toolbox
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags='-linkmode=external -X github.com/googleapis/mcp-toolbox/cmd.buildType=binary' -o mcp-toolbox .
}

package() {
  install -Dm755 mcp-toolbox/mcp-toolbox -t "${pkgdir}/usr/bin"
}
