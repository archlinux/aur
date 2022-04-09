# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=go-critic
pkgver=0.6.3
pkgrel=1
pkgdesc="Highly extensible Go source code linter"
arch=('x86_64')
url="https://go-critic.com"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='498eef8a04d52f25a7f3718211a46a55e0ae73f0'
source=("$pkgname::git+https://github.com/go-critic/go-critic.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed "s/^v//"
}

prepare() {
	cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
	cd "$pkgname"

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
	cd "$pkgname"

  go test -v ./...
}

package() {
	cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/gocritic

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
