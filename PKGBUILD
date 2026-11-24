# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gotip
pkgver=0.10.2
pkgrel=1
pkgdesc="Interactive picker for running Go tests"
arch=('x86_64' 'aarch64')
url="https://github.com/lusingander/gotip"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('77451f3bb35954ed473620ab0b8848d32abb5535f8d31aeb83eb3d6bdc751d32')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "gotip-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "gotip-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/gotip" ./cmd/gotip
}

check() {
  cd "gotip-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "gotip-${pkgver}"
  install -Dm755 "build/gotip" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
