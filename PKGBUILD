# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=gokart
pkgver=0.3.0
pkgrel=1
pkgdesc="Static analysis tool for Go"
arch=('x86_64')
url="https://github.com/praetorian-inc/gokart"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4c6df68a52e27fee902d4111eb02ea1c8868e45a6bd8f96e03f1f962afb017254d6ee77b8df241bf76c0664a8dd0531a1b43f4995f5a721ca249e455682edfb9')
b2sums=('d0d9df9d553c2ccaebb805eda9dc815341f9af5ad2e19684f3c1985ef9d97c753ddf33ffe579038d440c960fb75a304ef1f38b8e24f2028b63ade9a37da5fe15')

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
