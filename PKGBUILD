# Maintainer: roazanas <me@rznz.ru>

pkgname=e2ecp
pkgver=3.1.3
pkgrel=1
pkgdesc="End-to-end encrypted file transfer tool"
arch=('x86_64')
url="https://github.com/schollz/e2ecp"
license=('MIT')
depends=()
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a35e20b2f37be38eeac510408a773409bfed4669300b7730a55035e16d51afb')

build() {
  cd "$pkgname-$pkgver"

  cd web && npm install && npm run build && cd ..
  touch web/dist/.keep

  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -modcacherw"

  go build \
    -ldflags="-w -s" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
