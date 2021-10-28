# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=go-critic
pkgver=0.6.1
pkgrel=1
pkgdesc="Highly extensible Go source code linter"
arch=('x86_64')
url="https://go-critic.com"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/go-critic/go-critic/archive/v$pkgver.tar.gz")
sha512sums=('319a2c79dbdbf2298044b59a20e1b73af64f6e2ed43dc76072d3aff89502ca8a52870687279c4ad05576f28c03d968d7d3f56793c63fc2aaa061d8ef3533d480')
b2sums=('b1c02839f92e99f41f7eb4f9e7e63c70db54f0947196960f094785c1e4510f37984f71d5b95f9ebeceff3c833aec9cf38d6f7037fa89a90c6d2fd585024557dd')

prepare() {
	cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
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
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver" \
    -o build \
    ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"

  go test -v ./...
}

package() {
	cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/gocritic

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
