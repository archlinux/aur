# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=connet
pkgver=0.6.3
pkgrel=1
pkgdesc='A P2P reverse proxy with NAT traversal'
arch=('x86_64' 'aarch64')
url="https://github.com/$pkgname-dev/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f38b5544f939fabe130b5163d5b30e60c02658e98ff0baf6266e3af6f1adf076')
makedepends=('go')
depends=('glibc')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  if [ "$CARCH" = 'x86_64' ]; then
    export GOARCH=amd64
  elif [ "$CARCH" = 'aarch64' ]; then
    export GOARCH=arm64
  fi
  export GOOS=linux
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  go build -o "build/$pkgname" "cmd/$pkgname/main.go"
}

check() {
  cd "$pkgname-$pkgver"
  go test -cover -timeout 10s ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
