# Maintainer: roazanas <me@rznz.ru>

pkgname=e2ecp
pkgver=3.0.2
pkgrel=1
pkgdesc="End-to-end encrypted file transfer tool"
arch=('x86_64')
url="https://github.com/schollz/e2ecp"
license=('MIT')
depends=()
makedepends=('go' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b91b8fd9aea380ccacae72564d4d0056c4b9fda28cf65cf83f353c6a392e175')

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
