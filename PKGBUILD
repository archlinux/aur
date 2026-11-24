# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cosmo
pkgver=0.3.0
pkgrel=1
pkgdesc="Real-time PostgreSQL health and query monitoring TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mujib77/cosmo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f1c4759f1a0cb12e06be3064734eab31cc1928c69b7a7435de0074e6a92eb294')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "cosmo-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "cosmo-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/cosmo" .
}

check() {
  cd "cosmo-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "cosmo-${pkgver}"
  install -Dm755 "build/cosmo" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
