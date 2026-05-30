# Maintainer: Algorant <Algorantic@proton.me>
pkgname=ketch
pkgver=0.9.3
pkgrel=1
pkgdesc="Fast, stateless CLI for web search, code search, library docs, and scraping"
arch=('x86_64' 'aarch64')
url="https://github.com/1broseidon/ketch"
license=('MIT')
makedepends=('go')
optdepends=(
  'chromium: browser rendering for JavaScript-rendered pages'
  'github-cli: GitHub code search authentication via gh auth token'
)
options=(!debug)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'LICENSE'
)
sha256sums=('8722a073e8f48586cdf271ceaa26a395bfe23315a844752480495a212f6f50b6'
            'e70156b67cf31c8962232c0f4900ddfe742c5331fd9a1437ea5f4c41dc9bfb9f')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X github.com/1broseidon/ketch/cmd.version=v$pkgver" \
    -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
