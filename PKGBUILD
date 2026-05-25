# Maintainer: pentago <876756+pentago@users.noreply.github.com>

pkgname=terraform-mcp-server
pkgver=0.5.2
pkgrel=1
pkgdesc="Model Context Protocol (MCP) server for the Terraform ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/hashicorp/terraform-mcp-server"
license=('MPL-2.0')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('terraform: workspace and module operations')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f1c350360cfed54ab4cb9cc028846e37e9bf76441c7a347cc1037d8374f8990')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"
  export GOMODCACHE="$srcdir/gomodcache"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"
  export GOMODCACHE="$srcdir/gomodcache"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  # Upstream embeds GitCommit and BuildDate via -ldflags; we have no git
  # checkout here, so substitute the release tag and a reproducible date.
  local _builddate
  _builddate="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"

  go build \
    -ldflags="-s -w \
              -X github.com/hashicorp/terraform-mcp-server/version.GitCommit=v$pkgver \
              -X github.com/hashicorp/terraform-mcp-server/version.BuildDate=$_builddate" \
    -o build/$pkgname \
    ./cmd/terraform-mcp-server
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"
  export GOMODCACHE="$srcdir/gomodcache"
  # Exclude ./e2e: those tests shell out to `make docker-build` and require
  # Docker + BuildKit + a git HEAD, none of which exist in a makepkg sandbox.
  # Upstream gates them behind `--tags e2e` in the Makefile but the files
  # themselves lack a //go:build e2e directive, so they run unconditionally.
  local _pkgs
  _pkgs=$(go list ./... | grep -v '/e2e$')
  go test $_pkgs
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname  "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md       "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
