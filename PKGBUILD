# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=gokart
pkgver=0.1.1
pkgrel=1
pkgdesc="Static analysis tool for Go"
arch=('x86_64')
url="https://github.com/praetorian-inc/gokart"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ad54d8693e95c7ae8c67ca5ac534cd1a13d3cc4663a84904ebeef61524091e2b95424d3088be4d2ac58475988a88c96c6f76d9efa0a4635e0357e97264534e4d')

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
    -mod=readonly \
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
