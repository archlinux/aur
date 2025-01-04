# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=cloudip
pkgver=0.5.0
pkgrel=1
pkgdesc='CLI tool for identifying cloud providers'
arch=('x86_64')
url="https://github.com/jongwoo328/$pkgname"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('80f7714ea8a52fd7c993cf09c303100d3215f0342c288177f7964aabe9b59f4a')
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
