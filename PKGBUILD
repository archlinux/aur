# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=cloudip
pkgver=0.6.0
pkgrel=1
pkgdesc='CLI tool for identifying cloud providers'
arch=('x86_64')
url="https://github.com/jongwoo328/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e2f1ba8ea8757197a70650a2f1afe2df06fc99ff70e0687a8841222f1a77f266')
makedepends=('go')
depends=('glibc')

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
  go build \
    -ldflags "-X 'cloudip/cmd.Version=$pkgver'" \
    -o "build/$pkgname" \
    .
}

check() {
  cd "$pkgname-$pkgver"
  go test .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
