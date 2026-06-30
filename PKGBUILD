# Maintainer: Algorant
pkgname=xurl
pkgver=1.2.2
pkgrel=1
pkgdesc="Auth-enabled curl-like CLI for the X API"
arch=('x86_64' 'aarch64')
url="https://github.com/xdevplatform/xurl"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5047a4c4897939240b3c30ce67437298de3d14e29d38cc45e98f1e8fd2cc690b')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X github.com/xdevplatform/xurl/version.Version=v$pkgver" \
    -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 SKILL.md "$pkgdir/usr/share/doc/$pkgname/SKILL.md"
}
