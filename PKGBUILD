# Maintainer: pentago <876756+pentago@users.noreply.github.com>

pkgname=terraform-mcp-server
pkgver=0.5.2
pkgrel=3
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
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
	export GOPROXY=off

	local _builddate
	_builddate="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"

	go build \
		-ldflags="-linkmode=external -s -w \
		          -X github.com/hashicorp/terraform-mcp-server/version.GitCommit=v$pkgver \
		          -X github.com/hashicorp/terraform-mcp-server/version.BuildDate=$_builddate" \
		-o terraform-mcp-server-binary \
		./cmd/terraform-mcp-server
}

check() {
	cd "$pkgname-$pkgver"
	# Exclude ./e2e: those tests invoke `make docker-build` (needs Docker,
	# BuildKit, a git HEAD). Upstream gates them with `--tags e2e` in the
	# Makefile but the files lack a //go:build e2e directive, so plain
	# `go test ./...` runs them.
	go test -mod=readonly $(go list ./... | grep -v '/e2e$')
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 terraform-mcp-server-binary "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md                   "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md                "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
