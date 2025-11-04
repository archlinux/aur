# Maintainer: roazanas <me@rznz.ru>

pkgname=e2ecp
pkgver=3.0.3
pkgrel=1
pkgdesc="End-to-end encrypted file transfer tool"
arch=('x86_64')
url="https://github.com/schollz/e2ecp"
license=('MIT')
depends=()
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4b79a0eee4b66647c4cf024d09ac36b181b98cd72e8c6a5741263d71784a0cc8')

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
