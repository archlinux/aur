# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.4.0
pkgrel=2
pkgdesc="A tool to build, deploy, and release any application on any platform"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('go' 'go-bindata')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/waypoint/archive/v$pkgver.tar.gz")
b2sums=('c17499223e5f8ed4bb7407d33ff8c798cb50a8a5db00730faa3cb4256953b2e6f128c69f5aae005dc49ec33e8d52895b3b9941c41ca26721a5745bb1f1e451a5')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # build process extracted from Makefile
  cd "$pkgname-$pkgver"
  go build \
    -o ./internal/assets/ceb/ceb \
    ./cmd/waypoint-entrypoint

  cd internal/assets
  go-bindata \
    -pkg assets \
    -o prod.go \
    -tags assetsembedded \
    ./ceb

  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -tags assetsembedded \
    -o ./waypoint \
    ./cmd/waypoint
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 "$pkgname" -t "$pkgdir/usr/bin"
}
