# Maintainer: robertfoster
pkgname=forgejo-mcp
pkgver=2.34.1 # renovate: datasource=forgejo-releases depName=goern/forgejo-mcp registryUrl=https://codeberg.org
pkgrel=1
pkgdesc="Model Context Protocol (MCP) server for interacting with Forgejo REST API"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://codeberg.org/goern/forgejo-mcp/archive/v${pkgver}.tar.gz")
sha256sums=('7e312a563293d17f80804f2b0ae512cb84ea9ac1fd60fc911d99414494cede98')

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local LDFLAGS="-X \"main.Version=${pkgver}\""

  go build -v -ldflags "-s -w ${LDFLAGS}" -o forgejo-mcp .
}

package() {
  cd "forgejo-mcp"

  install -Dm755 forgejo-mcp "${pkgdir}/usr/bin/forgejo-mcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  # Install sample configuration files
  install -Dm644 .env.sample "${pkgdir}/usr/share/doc/${pkgname}/.env.sample"
}
