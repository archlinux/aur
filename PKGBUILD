# Maintainer: robertfoster
pkgname=forgejo-mcp
pkgver=2.10.1 # renovate: datasource=forgejo-releases depName=goern/forgejo-mcp registryUrl=https://codeberg.org
pkgrel=1
pkgdesc="Model Context Protocol (MCP) server for interacting with Forgejo REST API"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/goern/forgejo-mcp"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("https://codeberg.org/goern/forgejo-mcp/archive/v${pkgver}.tar.gz")
sha256sums=('44770fca7634a48663e36d55668796163c5b4b380ef4de1747263e13733f56b0')

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
  install -Dm644 mcp-settings-sample.json "${pkgdir}/usr/share/doc/${pkgname}/mcp-settings-sample.json"
  install -Dm644 config.json "${pkgdir}/usr/share/doc/${pkgname}/config.json"
}
