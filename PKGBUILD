# Maintainer: ml <>
pkgname=svu
pkgver=1.11.0
pkgrel=1
pkgdesc='Semantic Version Util'
arch=('x86_64')
url='https://github.com/caarlos0/svu'
license=('MIT')
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3bb79e66096e6a6ec0a83b7dec47afd29b1a966b7597f3999db9a123970562d1')
_go_flags=(-ldflags "-linkmode=external -X main.version=v$pkgver")

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname" "${_go_flags[@]}" main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test -v -short "${_go_flags[@]}" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
