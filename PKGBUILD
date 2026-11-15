# Maintainer: Syed Amer Gilani <syed.amer@gilani.eu>

pkgname=truenas-mcp
pkgver=1.0.0
pkgrel=1
pkgdesc='Model Context Protocol (MCP) server for TrueNAS'
arch=('x86_64' 'aarch64')
url='https://github.com/truenas/truenas-mcp'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('100e70f8ad9fe98524a7de3eb602f8a882bbce9aa5c3ea58f3852bf85dff4f5c')

# cgo is left enabled so name resolution goes through glibc and `.local`
# (mDNS) host names work, which the static upstream release binary cannot do.
#
# -trimpath is passed to `go build` itself rather than through GOFLAGS: some
# upstream tests locate source files with runtime.Caller, which trimpath
# rewrites to module-relative paths.

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export GOTELEMETRY=off
  export GOTOOLCHAIN=local
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOTELEMETRY=off
  export GOTOOLCHAIN=local
  mkdir -p build
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -ldflags "-X main.Version=$pkgver" \
    -o build/truenas-mcp \
    ./cmd/truenas-mcp
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export GOTOOLCHAIN=local
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/truenas-mcp "$pkgdir/usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
