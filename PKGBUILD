# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl
pkgver=0.10.0
pkgrel=1
pkgdesc='Cherry Servers CLI for managing cloud infrastructure'
arch=('x86_64' 'aarch64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
makedepends=('git' 'go')
depends=('glibc')
conflicts=('cherryctl-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f035906ead30c538682ed322b2d10627de18c15ee586fe813aac9a19bfa5e064')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  
  # Download dependencies
  go mod download -x
}

build() {
  cd "${pkgname}-${pkgver}"
  
  # Set up proper build flags as per Arch Go packaging guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  # Get version info for proper versioning
  local _version="v${pkgver}"
  local _commit=$(git ls-remote "${url}" "refs/tags/v${pkgver}" | cut -f1)
  
  # Build with proper ldflags for version information
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
      -X github.com/cherryservers/cherryctl/internal/version.Version=${_version} \
      -X github.com/cherryservers/cherryctl/internal/version.Commit=${_commit:0:7}" \
    -o build/cherryctl \
    .
}

# Disabled due to upstream linter issues
# check() {
#   cd "${pkgname}-${pkgver}"
#   
#   # Run tests with proper flags
#   export CGO_CPPFLAGS="${CPPFLAGS}"
#   export CGO_CFLAGS="${CFLAGS}"
#   export CGO_CXXFLAGS="${CXXFLAGS}"
#   export CGO_LDFLAGS="${LDFLAGS}"
#   export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
#   
#   # Run tests
#   go test -v ./...
# }

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 build/cherryctl "${pkgdir}/usr/bin/cherryctl"
  
  # Install license
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
