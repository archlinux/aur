# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=gokart
pkgver=0.2.0
pkgrel=1
pkgdesc="Static analysis tool for Go"
arch=('x86_64')
url="https://github.com/praetorian-inc/gokart"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9e99a459f8ad75fcb432e3e254f949d1d8c96bca469b390172facea2e6357c61ce2e81538093a5543f80d26187f87b2fdc4f91801181d72df417fc8830629ac9')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
