# Maintainer: Ben Word <ben@benword.com>
pkgname=quien
pkgver=0.12.0
pkgrel=1
pkgdesc="A better whois and domain intelligence toolkit"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('49eef2d196a1b9c1e46c037c8fa300f6ced71c952828761fb4810ad8151e14c2')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="$srcdir/gomod"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOMODCACHE="$srcdir/gomod"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
