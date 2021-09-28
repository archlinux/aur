# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ksuid
pkgver=1.0.4
pkgrel=1
pkgdesc="K-Sortable Globally Unique IDs"
arch=('x86_64')
url="https://github.com/segmentio/ksuid"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6b1ad1020ca44fb8d22792641368329c06a16c8a5bca2204a78aaa9c07af8df00e43bdc05a407d0eeec9c53f1b3245e9cb3314fba0a1cd7bfbf423b86aa7e66a')
b2sums=('0963023910a3a47e007b40d3755a1ca3512821f381cd138d50e24543cb6182380eb0b589c7592205e473b4f06efa660fca7d82917b5e429de0970325bae6aad3')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
