# Maintainer: Snowy Fluffy <snowy.lnnk@gmail.com>
pkgname=thronectl
_reponame=Throne-api
pkgver=0.4.0
pkgrel=1
pkgdesc='Command-line tool and web UI for the Throne API (control Throne from scripts)'
arch=('x86_64' 'aarch64')
url='https://github.com/throneproj/Throne-api'
license=('MIT')
makedepends=('go')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ffd6304d6393b4697a70e74214f4988ee26093f1929930b333c38ce03caf6ed')

build() {
  cd "$_reponame-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-s -w -X main.version=v$pkgver" \
    -o "$pkgname" ./cmd/thronectl
}

check() {
  cd "$_reponame-$pkgver"
  go test ./...
}

package() {
  cd "$_reponame-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
