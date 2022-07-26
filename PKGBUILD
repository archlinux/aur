# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-parallel-copy
pkgver=0.4.0
pkgrel=1
pkgdesc='A tool for parallel copying of CSV data into a TimescaleDB hypertable'
arch=('x86_64')
url='https://github.com/timescale/timescaledb-parallel-copy'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='c0b5b0d8cefaacc9929f96e28e06b4c782ea3e90'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
}
