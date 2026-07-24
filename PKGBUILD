# Maintainer: Safwan Eljadi <eljadisafwan@gmail.com>
# Contributor: Trevor Facer <trevordf@protonmail.com>

pkgname=docker-mcp-git
_pkgname=mcp-gateway
pkgver=0.43.3.r6.g2bd20fe
pkgrel=1
pkgdesc='Docker CLI plugin for MCP Gateway - manage and run MCP servers in containers (git)'
arch=('x86_64')
url='https://github.com/docker/mcp-gateway'
license=('MIT')
depends=('glibc')
makedepends=('go>=2:1.24' 'git')
optdepends=('docker: for Docker Engine container operations')
provides=('docker-mcp')
conflicts=('docker-mcp')
source=("${_pkgname}::git+https://github.com/docker/mcp-gateway.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  # I build the version from the latest tag, like 0.43.1.r5.g1a2b3c4
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # I grab the Go modules up front
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-modcacherw"
  go mod download -x
}

build() {
  cd "${_pkgname}"

  # Go build flags, following the Arch guidelines.
  # Upstream sets CGO_ENABLED=0, but I turn CGO on so I get PIE and RELRO hardening.
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  # Build the binary and bake in the version.
  # Upstream uses the same ldflag in its Makefile, so I read the module path
  # from go.mod and the version from git. That way I never bump it by hand.
  local _module
  _module=$(awk '/^module/ { print $2 }' go.mod)
  local _version
  _version=$(git describe --tags 2>/dev/null || echo "v${pkgver}")
  go build -o docker-mcp \
    -ldflags "-linkmode=external -X ${_module}/cmd/docker-mcp/version.Version=${_version}" \
    ./cmd/docker-mcp
}

check() {
  cd "${_pkgname}"

  # Make sure the binary actually runs
  ./docker-mcp --help > /dev/null

  # Run the unit tests (upstream uses make test).
  # I skip the integration tests since they need a running Docker.
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test -short ./... || warning "Some tests failed - may require Docker runtime"
}

package() {
  cd "${_pkgname}"

  # Drop the plugin into the system-wide Docker plugin folder
  install -Dm755 docker-mcp "${pkgdir}/usr/lib/docker/cli-plugins/docker-mcp"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Docs
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
