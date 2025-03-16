# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=sisyphus
pkgver=0.4.5
pkgrel=1
pkgdesc='Convert gemtext to html or markdown'
arch=('x86_64')
url="https://github.com/hachiya-kurisu/$pkgname"
license=('BSD-2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29098d1aec8c3e4fb4e1336dc1993426b362fc23a818e50d90e7150fb459362c')
makedepends=('go')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
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
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.gmi -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
