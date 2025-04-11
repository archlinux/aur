# Maintainer: Maciej Kopeć <maciejkopec92@gmail.com>
pkgname=vi-mongo
pkgver=0.1.24
pkgrel=1
pkgdesc="Terminal User Interface for MongoDB"
arch=('x86_64')
url="https://github.com/kopecmaciej/vi-mongo"
license=("Apache-2.0")
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7aaf28b6ca6924cdf3bec54fdc0482fde568e18dbdf0666042c250479c4b53b5')
options=('!debug')

prepare() {
  cd "$pkgname-$pkgver"
  GOFLAGS="-mod=readonly" go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
  export GOPATH="$srcdir"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
    -X github.com/kopecmaciej/vi-mongo/cmd.version=v$pkgver"

  go build -ldflags="$ld_flags" -o "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
