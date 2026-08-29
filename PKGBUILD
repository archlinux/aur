# Maintainer: Algorant
pkgname=ketch
pkgver=0.14.0.r1.obscura.1
pkgrel=1
pkgdesc="Fast, stateless CLI for web search, code search, library docs, and scraping"
arch=('x86_64' 'aarch64')
url="https://github.com/Algorant/ketch"
license=('MIT')
makedepends=('go')
optdepends=(
  'obscura-browser-bin: lightweight rendered-page fallback for JavaScript pages and suitable HTTP 403 responses'
  'chromium: optional full browser renderer for layout-dependent pages'
  'github-cli: GitHub code search authentication via gh auth token'
)
options=(!debug)
_upstream_tag=0.14.0-obscura.1
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_upstream_tag.tar.gz")
sha256sums=('4ae9674b262534e3349c0c198fb23d526a9c415cea8ac804e0efe86604b87fb4')

build() {
  cd "$pkgname-$_upstream_tag"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X github.com/1broseidon/ketch/cmd.version=v$_upstream_tag" \
    -o "$pkgname" .
}

check() {
  cd "$pkgname-$_upstream_tag"
  go test ./...
}

package() {
  cd "$pkgname-$_upstream_tag"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
