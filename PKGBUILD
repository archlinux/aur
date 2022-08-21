# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=license-detector
pkgver=4.3.0
pkgrel=1
pkgdesc='Reliable project licenses detector'
arch=('x86_64')
url='https://github.com/go-enry/go-license-detector'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='4f2ca6af2ab943d9b5fa3a02782eebc06f79a5f4'
source=("$pkgname::git+$url#commit=$_commit")
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
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
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
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
}
