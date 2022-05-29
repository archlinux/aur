# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mimir
pkgver=2.1.0
pkgrel=1
pkgdesc='A scalable long-term storage for Prometheus'
arch=('x86_64')
url='https://grafana.com/oss/mimir/'
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='840c68616a6fa4a4f86cbd581b05c43d0bfee7e0'
source=("$pkgname::git+https://github.com/grafana/mimir.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^mimir-//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build
}

build() {
  cd "$pkgname"

  # verify dependencies
  go mod verify

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS \
    -X github.com/grafana/mimir/pkg/util/version.Branch=main \
    -X github.com/grafana/mimir/pkg/util/version.Revision=$(git rev-parse --short HEAD) \
    -X github.com/grafana/mimir/pkg/util/version.Version=$pkgver" \
    -o build \
    ./cmd/...
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/*
}
