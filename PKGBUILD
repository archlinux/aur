# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=obelisk
pkgver=0.90
pkgrel=1
pkgdesc="CLI tool for saving web page as single HTML file"
arch=('x86_64')
url="https://github.com/go-shiori/obelisk"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='77069341882e2d45c15af83bec39594ae6e37520' # v0.90 (v0.91 is also present on the same commit...)
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
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
    -ldflags "-linkmode external -extldflags $LDFLAGS" \
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
  install -vDm755 -t "$pkgdir/usr/bin" build/obelisk

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
