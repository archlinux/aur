# Maintainer: roazanas <me@rznz.ru>

pkgname=e2ecp
pkgver=3.0.5
pkgrel=1
pkgdesc="End-to-end encrypted file transfer tool"
arch=('x86_64')
url="https://github.com/schollz/e2ecp"
license=('MIT')
depends=()
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b0c7add9e51442c503503fdb779c52bc3d8bb03c8d84f82e3cb446a90e58f39e')

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
