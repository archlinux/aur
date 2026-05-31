# Maintainer: Algorant <Algorantic@proton.me>
pkgname=xurl
pkgver=1.1.1
pkgrel=1
pkgdesc="Auth-enabled curl-like CLI for the X API"
arch=('x86_64' 'aarch64')
url="https://github.com/xdevplatform/xurl"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ea2ad727154d7de255443139abfe08c98e3968a15c46e495f8591d2cad2d97a')

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
