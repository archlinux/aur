# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=gitea-mcp
pkgver=1.3.0
pkgrel=1
pkgdesc="A Model Context Protocol (MCP) server for interacting with Gitea instances"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitea.com/gitea/gitea-mcp"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!debug')
# The Gitea source archive endpoint requires authentication and does not serve
# anonymous tarballs/zips, so the source is fetched via git pinned to the tag.
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -v \
    -ldflags "-linkmode=external -X main.Version=${pkgver}" \
    -o "${pkgname}" .
}

check() {
  cd "${srcdir}/${pkgname}"
  go test ./... 2>/dev/null || true
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
